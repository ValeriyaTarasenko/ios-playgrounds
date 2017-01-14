//1
struct Point {
    var x: Double
    var y: Double
}

func - (a: Point, b: Point) -> Point {
    return Point(x: a.x - b.x, y: a.y - b.y)
}

func -= (a: inout Point, b: Point) {
    a = a - b
}

prefix func -- (a: inout Point) -> Point {
    a.x -= 1
    a.y -= 1
    return a
}

postfix func -- (a: inout Point) -> Point {
    let b = a
    --a
    return b
}

func / (a: Point, b: Point) -> Point {
    return Point(x: a.x / b.x, y: a.y / b.y)
}

func /= (a: inout Point, b: Point) {
    a = a / b
}

func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}

func *= (a: inout Point, b: Point) {
    a = a * b
}

var p1 = Point(x: 5, y: 6)
var p2 = Point(x: 2, y: 4)

print(p1 - p2)
p1 -= p2
print(p1)
--p1
print(p1)
p2--
print(p2)
print(p1/p2)
p1 /= p2
print(p1)
print(p1*p2)
p1 *= p2
print(p1)

//2
struct Size {
    var h: Int
    var w: Int
}
struct Rect {
    var point: Point
    var size: Size
}

//3
func + (st: String, i: Int) -> String {
    return st + String(i)
}

func += (st: inout String, i: Int) {
    st = st + i
}
var st1 = "Hello"
var i = 3
print(st1 + i)
st1 += i
print(st1)
//4
infix operator %%
func %% (st1: inout String, st2: String)  {
    let arr1 = st1.characters.map { String($0) }
    let arr2 = st2.characters.map { String($0) }
    var st3 = ""
    for i in 0..<arr1.count {
        if i < arr2.count {
            if arr1[i] == arr2[i] {
                st3 += arr1[i].uppercased()
            } else {
                st3 += arr1[i]
            }
        } else {
            st3 += arr1[i]
        }
    }
    st1 = st3
}

var str1 = "abcd"
var str2 = "adcbvc"
str1 %% str2
print(str1)