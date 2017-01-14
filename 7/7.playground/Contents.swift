
//1
var days = [31,29,31,30,31,30,31,31,30,31,30,31]

for day in days {
    print("days in month \(day)")
}

var months = ["J","F","M","Ap","May","June","July","Aug","S","Oc","N","D"]
for i in 0..<months.count {
    print("month - \(months[i]) days in month \(days[i])")
}

var tuple = [("J",31),("F",29),("M",31),("Ap",30),("May",31),("June",30),("July",31),("Aug",31),("S",30),("Oc",31),("N",30),("D",31)]
for j in tuple {
    ("month - \(j.0) days in month \(j.1)")
}

for i in (0..<days.count).reversed() {
    print(days[i])
}

let DR = (m: "N", d: 23)
print(DR)
var sum = 0
for j in tuple {
    if j.0 != DR.m {
        sum += j.1
    } else {
        sum += DR.d
        break
    }
}

print(sum)

//2
sum = 0
var a: [String?] = ["we3", "4", nil, "-1", "nh"]
for i in 0..<a.count {
    if a[i] != nil{
        if var t = Int(a[i]!) {
            sum += t
        }
    }
}
print(sum)

//3
var alf = "abcdefghijklmnopqrstuvwxyz"
var fla = [String]()

for i in alf.characters {
    fla.insert(String(i), at: 0)
}
print(fla)
