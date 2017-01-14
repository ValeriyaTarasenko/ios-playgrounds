func prior(a: String) -> Int {
    switch a {
    case "(": return 0
    case ")": return 1
    case "+", "-": return 2
    case "*", "/": return 3
    default: return 4
    }
}

func prior1(a: String) -> Int {
    switch a {
    case "(": return 1
    //case ")": return 1
    case "+", "-": return 2
    case "*", "/": return 3
    default: return 4
    }
}

func toArray(mathString: String) -> [String] {
    var arrString = [String()]
    var number = ""
    for symbol in mathString.characters {
        if Double(String(symbol)) != nil {
            number += String(symbol)
            //arrString.append(String(symbol))
        } else {
            arrString.append(number)
            number=""
            arrString.append(String(symbol))
        }
    }
    return arrString
}

func calc(mathString: String) -> String {
    //var arrString = mathString.characters.map { String($0) }
    var arrString = toArray(mathString: mathString)
    var str = [String]()
    var stek = [String]()
    var stekPost = [String]()
    for i in 0..<arrString.count {
        
        if arrString[i] == ")" {
            str.append(stek[stek.count - 1])
            stek.remove(at: stek.count - 1)
            stek.remove(at: stek.count - 1)
        }
        
        if Double(arrString[i]) != nil {
            str.append(arrString[i])
        }
        
        if(arrString[i] == "(") {
            stek.append(arrString[i])
        }
        
        if arrString[i] == "+" || arrString[i] == "-" || arrString[i] == "*" || arrString[i] == "/" {
            if(stek.count == 0) {
                stek.append(arrString[i])
            } else if prior1(a: stek[stek.count-1]) < prior1(a: arrString[i]) {
                stek.append(arrString[i])
            } else {
                while stek.count != 0 && prior1(a: stek[stek.count-1]) >= prior1(a: arrString[i]) {
                    str.append(stek[stek.count-1])
                    stek.remove(at: stek.count - 1)
                    stekPost.append(arrString[i])
                }
            }
        }
    }
    
    for i in 0..<stekPost.count {
        str.append(stekPost[i])
    }
    for i in 0..<stek.count {
        str.append(stek[stek.count - 1 - i])
    }
    
    var value = 0.0
    while str.count != 1 {
        for i in 0..<str.count {
            if str[i] == "+" || str[i] == "-" || str[i] == "*" || str[i] == "/" {
                if str[i] == "+" {
                    value = Double(str[i-2])! + Double(str[i-1])!
                } else if str[i] == "-" {
                    value = Double(str[i-2])! - Double(str[i-1])!
                } else if str[i] == "*" {
                    value = Double(str[i-2])! * Double(str[i-1])!
                } else if str[i] == "/" {
                    value = Double(str[i-2])! / Double(str[i-1])!
                }
                
                str[i-2] = String(value)
                str.remove(at: i-1)
                str.remove(at: i-1)
                break
            }
        }
    }
    return str[0]
}

let mathString = "3+5*((5-4)/3)"
//let mathString = "31+4*2/(10-5)"
var str = calc(mathString: mathString)
print(str)
//calc(mathString: mathString)