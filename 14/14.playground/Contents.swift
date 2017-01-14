import Foundation

//1

struct Student {
    struct BirthDay {
        var day: Int
        var month: Int
        var year: Int
    }
    
    var firstName: String {
        didSet {
            firstName = firstName.capitalized
        }
        
    }
    
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fulName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            let words  = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    
    var birthDay: BirthDay
    
    var age: Int {
        get {
            let today = Date()
            let unitFlags = Set<Calendar.Component>([.hour, .year, .minute])
            var calendar = Calendar.current
            calendar.timeZone = TimeZone(identifier: "UTC")!
            let components = calendar.dateComponents(unitFlags, from: today)
            if let year = components.year {
                return year - birthDay.year
                //print(year1)
            }
            return 0
        }
    }
    
    var study: Int {
        return age < 6 ? 0 : age - 6
    }
    
}

var student = Student(firstName: "Lera", lastName: "Tarasenko", birthDay: Student.BirthDay(day: 23, month: 11, year: 1990))

print(student.age)
print(student.study)


//2
struct LineSegment {
    struct Point {
        var x: Double
        var y: Double
    }
    
    var a: Point
    var b: Point
    
    var middle: Point {
        get {
            let midx = (a.x + b.x) / 2
            let midy = (a.y + b.y) / 2
            
            return Point(x: midx, y: midy)
        }
        
        set {
            let dx = newValue.x - middle.x
            let dy = newValue.y - middle.y
            
            a.x = a.x + dx
            a.y = a.y + dy
            
            b.x = b.x + dx
            b.y = b.y + dy
        }
    }
    
    var length: Double {
        get {
            return sqrt(pow((b.x - a.x), 2) + pow((b.y - a.y), 2))
        }
        
        set {
            b = Point(x: a.x + (b.x - a.x) * newValue / length, y: a.y + (b.y - a.y) * newValue / length)
        }
    }
}

var segment = LineSegment(a: LineSegment.Point(x: 2, y: 8), b: LineSegment.Point(x: 4, y: 10))
print(segment.middle)
print(segment.length)

segment.middle = LineSegment.Point(x: 4, y: 8)
print(segment.a)
print(segment.b)

segment.length = 2.5
print(segment.a)
print(segment.b)

