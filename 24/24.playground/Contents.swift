//1-3
extension Int {
    var isNegative: Bool {
        return self < 0
    }
    
    var isPositive: Bool {
        return !isNegative
    }
    
    var bool: Bool {
        return self != 0
    }
    
    var countInt: Int {
        //return count(String(self))
        return String(self).characters.count
    }
    
    subscript(index: Int ) -> String {
        get {
            let c = countInt - index - 1
            for (idx, element) in String(self).characters.enumerated() {
                if idx == c {
                    return String(element)
                }
            }
            return ""
        }
        
        set {
            let c = countInt - index - 1
            let indexInsert = c
            var ch = String(self)
            let removingIndex = ch.index(ch.startIndex, offsetBy: indexInsert)
            ch.remove(at: removingIndex)
            let i = ch.index(ch.startIndex, offsetBy: indexInsert)
            ch.insert(Character(newValue), at: i)
            self = Int(ch) ?? 0
        }
    }
}

var a = 18515392

print(a[3])

a[3] = "6"
print(a)
//4
extension String {
    subscript(range: CountableRange<Int>) -> String {
        get {
            // let interv = Range(start: self.index(self.startIndex, offsetBy: range.lowerBound), end: self.index(self.startIndex, offsetBy: range.upperBound))
            var ch = ""
            for index in range.lowerBound..<range.upperBound {
                let char = self[self.index(self.startIndex, offsetBy: index)]
                ch += String(char)
            }
            return String(ch)
        }
        
        set {
            var ch = self
            var count = 0
            for index in range.lowerBound..<range.upperBound {
                ch.remove(at: ch.index(ch.startIndex, offsetBy: index))
                let i = newValue[newValue.index(newValue.startIndex, offsetBy: count)]
                ch.insert(i, at: ch.index(ch.startIndex, offsetBy: index))
                count = count + 1
            }
            self = ch
        }
    }
}

var b = "argarh"
print(b[0..<3])
b[0..<1] = "B"
print(b)

//5
extension String {
    mutating func truncate(_ index: Int) {
        var ch = ""
        //var max = String(self).characters.count > index ? String(self).characters.count : index
        if String(self).characters.count > index {
            for i in 0..<index {
                ch = ch + String(self[self.index(self.startIndex, offsetBy: i)])
            }
            if self != ch {
                ch += "..."
            }
            self = ch
        }
    }
}

var c = "Hi hi hi"
// c.truncate(4)
// print(c)
c.truncate(10)
print(c)