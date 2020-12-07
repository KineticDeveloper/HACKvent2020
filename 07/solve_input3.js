'use strict';

let text3 = "DinosAreLit"
let b = 42
let input3 = ""
for (let k = 0; k < text3.length; k++) {
    let c = text3.charCodeAt(k) ^ b
    input3 += String.fromCharCode(c)
    b = (b + k - 4) % 255
    console.log('new b', b)
}
console.log("Input3 must be ", input3)

//let input3 = "nOMNSaSFjC["
