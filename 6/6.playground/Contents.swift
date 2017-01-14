
//1
let a = "9"
let b = "io5"
let c = "-2"
let d = "1.25"
let f = "fr"

var a2 = Int(a) ?? 0
var b2 = Int(b) ?? 0
var c2 = Int(c) ?? 0
var d2 = Int(d) ?? 0
var f2 = Int(f) ?? 0

var sum = a2 + b2 + c2 + d2 + f2
print(sum)

var a3 = Int(a) != nil ? a : "nil"
var b3 = Int(b) != nil ? b : "nil"
var c3 = Int(c) != nil ? c : "nil"
var d3 = Int(d) != nil ? d : "nil"
var f3 = Int(f) != nil ? f : "nil"

var strSum = a3 + " + " + b3 + " + " + c3 + " + " + d3 + " + " + f3 + " = "
strSum = strSum + String(sum)
print(strSum)

//2
let simbols = "\u{03D6} \u{0468} \u{05D8} \u{06E9} \u{0806} "
print(simbols)
//countElements(simbols)

//3
let alf = "abcdefghijklmnopqrstuvwxyz"
var simb: Character = "j"
var index = 0
for (i, j) in alf.characters.enumerated() {
    index = index + 1
    if j == simb {
        print("simbol \(j) index \(i+1)")
    }
}

