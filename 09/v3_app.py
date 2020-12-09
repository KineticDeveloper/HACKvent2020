from flask import Flask
import werkzeug.debug
app = Flask("name")
print(werkzeug.debug.get_pin_and_cookie_name(app))
