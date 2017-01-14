


//2
var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversed = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

//3
func f(array: [Int], c: (Int?,Int) -> Bool) -> Int{
    var a: Int? = 10
    
    for i in array {
        if c(a, i) {
            a = i
        }
    }
    
    return a!
}

var array = [5, 9, 6, 7, 25]
print(f(array: array) {
    (s1, s2) in return s1 == s2
})

//4
func priority(a: Character) -> Int {
    switch a {
    case "a", "e", "i", "o", "u", "y": return 1
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z": return 2
    case "0"..."9": return 3
    default: return 4
    }
}

var str = "edfvbkm 3463nuigbnmkih leriy9kf,skjg)"
var charArray = str.characters.sorted {//(x, y) in
    let px = priority(a: $0)
    let py = priority(a: $1)
    switch (px,py) {
    case _ where (px > py) : return false
    case _ where (px < py) : return true
    default: return $0 < $1
        //case let (a,b) = (priority(x),priority(y)) where a > b: return false
    }
}

print(charArray)

//5
func f2(array: [Character], c: (Character?,Character) -> Bool) -> Character {
    var a = array[0]
    for i in array {
        if c(a, i) {
            a = i
        }
    }
    return a
}

var array2: [Character] = ["a","f","u","3",".","]"]
let max = f2(array: array2) { $0 ?? " " > $1 }
let min = f2(array: array2) { $0 ?? " " < $1 }

print(max)
print(min)