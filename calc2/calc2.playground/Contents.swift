func calc(mathString: String) {
    var arrString = mathString.characters.map { String($0) }
    var value = 0.0
    while arrString.count != 1 {
        
        var arrInt = [Int]()
        var index = 0
        for i in 0..<arrString.count {
            if arrString[i] == "+" || arrString[i] == "-" || arrString[i] == "*" || arrString[i] == "/" || arrString[i] == ")" {
                index -= 1
            } else {
                index += 1
            }
            //print(arrString[i])
            arrInt.append(index)
        }
        var max = 0
        var indexMax = 0
        for i in 0..<arrInt.count {
            if arrInt[i] > max {
                max = arrInt[i]
                indexMax = i
            }
        }
        
        if arrString[indexMax + 1] == "+" {
            value = Double(arrString[indexMax])! + Double(arrString[indexMax+2])!
        } else if arrString[indexMax + 1] == "-" {
            value = Double(arrString[indexMax])! - Double(arrString[indexMax+2])!
        } else if arrString[indexMax + 1] == "*" {
            value = Double(arrString[indexMax])! * Double(arrString[indexMax+2])!
        } else if arrString[indexMax + 1] == "/" {
            value = Double(arrString[indexMax])! / Double(arrString[indexMax+2])!
        }
        if arrString[indexMax-1] == "(" {
            arrString[indexMax-1] = String(value)
            for _ in 0..<4 {
                arrString.remove(at: indexMax)
            }
        } else {
            arrString[indexMax] = String(value)
            for _ in 0..<2 {
                arrString.remove(at: indexMax)
            }
        }
    }
    print(value)
    // ch.remove(at: removingIndex)
}

let mathString = "(3+(5*((5-4)/3)))"
calc(mathString: mathString)