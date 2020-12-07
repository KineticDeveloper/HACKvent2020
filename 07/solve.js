'use strict';

String.prototype.replaceAt = function (index, replacement) {
    return this.substr(0, index) + replacement + this.substr(index + replacement.length);
}

var input1 = "xBxuxmxBxuxmxWxixtxhxTxhxexTxuxmxTxuxmx"
let input2 = "htroFdnAkcaB"
let input3 = "nOMNSaSFjC["

let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
let number = "0123456789"

let str2 = "00ZDNfMzRzeX0="
for (let i = 0; i < number.length; i++) {

    for (let i14 = 0; i14 < alphabet.length; i14++) {
        input1 = input1.replaceAt(14, alphabet[i14])

        let variables = number[i] + input1[14]

        let str = "SFYyMH" + input1[17] + "yMz" + number[i] + "zcnMzXzN" + input1[3] + "ZzF" + input1[9] + "MzNyM" + input1[13] + "5n" + input1[14] + "2"
        let b64encoded = str + str2
        let flag = Buffer.from(b64encoded, 'base64').toString()
        // if (flag.startsWith("HV20{"))
        if (flag.startsWith("HV20{") && flag.endsWith("3ng1n33r1ng_m4d3_34sy}")) {
            console.log(flag, input1)
        }
    }
}

