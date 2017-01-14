//1
var dict = ["Kolya" : 5, "Lera" : 3, "Petya" : 4, "Vasya" : 2]
print(dict)

dict["Lera"] = 4
dict.updateValue(3, forKey: "Vasya")

dict["Lena"] = 5
dict["Vova"] = 3

dict["Petya"] = nil
dict.removeValue(forKey: "Vova")
print(dict)

var sum = 0
for key in dict.keys {
    sum += dict[key] ?? 0
}
var sr = Double(sum)/Double(dict.count)
print(sr)

//2
var month = ["J" : 31,"F" : 29,"M" : 31,"Ap" : 30,"May" : 31,"June" : 30,"July" : 31,"Aug" : 31,"S" : 30,"Oc" : 31,"N" : 30,"D" : 31]
print(month)

for (i, j) in month {
    print("month \(i) - day \(j)")
}

for key in month.keys {
    print("month \(key) - day \(month[key] ?? 0)")
}

//3
var descLine = ["a","b","c","d","i","f","g","h"]
var desc = [String : Bool]()

for i in 0..<descLine.count {
    for j in 1..<9 {
        if (i % 2 == 0 && j % 2 != 0) || (i % 2 != 0 && j % 2 == 0) {
            desc["\(descLine[i])\(j)"] = true
        } else {
            desc["\(descLine[i])\(j)"] = false
        }
    }
}
print(desc)