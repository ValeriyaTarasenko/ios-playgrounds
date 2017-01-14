//1
struct Student {
    var name: String
    var surname: String
    var birthYear: Int
    var mark: Float
}

var student1 = Student(name: "Kolya", surname: "Mikhailishin", birthYear: 1990, mark: 5)
var student2 = Student(name: "Lera", surname: "Tarasenko", birthYear: 1990, mark: 4.5)
var student3 = Student(name: "Vasya", surname: "Pypkin", birthYear: 1990, mark: 3.7)
var student4 = Student(name: "Pavel", surname: "Mikhailishin", birthYear: 1994, mark: 4.3)
var students = [student1, student2, student3, student4]
//2
func journal(students: [Student]) {
    for i in 0..<students.count {
        print("\(i+1). \(students[i].surname) \(students[i].name) \(students[i].birthYear) \(students[i].mark)")
    }
}

journal(students: students)

//3
print("////////////////////////////////////////")
let stStudents = students.sorted {$0.mark > $1.mark}
journal(students: stStudents)

//4
print("////////////////////////////////////////")
let stStudents2 = students.sorted {s1, s2 in
    if s1.surname == s2.surname {
        return s1.name < s2.name
    }
    return s1.surname < s2.surname
}
journal(students: stStudents2)

// //5
print("////////////////////////////////////////")
var clonStudents = students
clonStudents[0].mark = 2
clonStudents[1].surname = "Mikhailishina"
journal(students: clonStudents)
journal(students: students)

//6
class calssStudent {
    var name: String
    var surname: String
    var birthYear: Int
    var mark: Float
    
    init(name: String, surname: String, birthYear: Int, mark: Float){
        self.name      = name
        self.surname   = surname
        self.birthYear = birthYear
        self.mark      = mark
    }
}

print("////////////////////////////////////////")
var clStudent1 = calssStudent(name: "Kolya", surname: "Mikhailishin", birthYear: 1990, mark: 5)
var clStudent2 = calssStudent(name: "Lera", surname: "Tarasenko", birthYear: 1990, mark: 4.5)
var clStudent3 = calssStudent(name: "Vasya", surname: "Pypkin", birthYear: 1983, mark: 3.7)
var clStudent4 = calssStudent(name: "Pavel", surname: "Mikhailishin", birthYear: 1994, mark: 4.3)
let clStudents = [clStudent1, clStudent2, clStudent3, clStudent4]

func clJournal(clStudents: [calssStudent]) {
    for i in 0..<clStudents.count {
        print("\(i+1). \(clStudents[i].surname) \(clStudents[i].name) \(clStudents[i].birthYear) \(clStudents[i].mark)")
    }
}

clJournal(clStudents: clStudents)

print("////////////////////////////////////////")
let clStudents2 = clStudents.sorted {$0.mark > $1.mark}
clJournal(clStudents: clStudents2)

print("////////////////////////////////////////")

let clStudents3 = clStudents.sorted {s1, s2 in
    if s1.surname == s2.surname {
        return s1.name < s2.name
    }
    return s1.surname < s2.surname
}

clJournal(clStudents: clStudents3)

print("////////////////////////////////////////")
var clonClStudents = clStudents
clonClStudents[0].mark = 2
clonClStudents[1].surname = "Mikhailishina"
clJournal(clStudents: clonClStudents)
clJournal(clStudents: clStudents)

//7
print("////////////////////////////////////////")
enum Color: String {
    case Black = "Black"
    case White = "White"
}

enum FigureName: String {
    case King    = "King"
    case Queen   = "Queen"
    case Knight  = "Knight"
    case Rook    = "Rook"
    case Bishope = "Bishope"
    case Pawns   = "Pawns"
}

class ClFigure {
    var color: Color
    var x: Int
    var y: Int
    var name: FigureName
    
    init(color: Color, x: Int, y: Int, name: FigureName){
        self.color = color
        self.x     = x
        self.y     = y
        self.name  = name
    }
    
}

var clFigure1 = ClFigure(color: .Black, x: 4, y: 2, name: .King)
var clFigure2 = ClFigure(color: .White, x: 1, y: 7, name: .Queen)
var clFigure3 = ClFigure(color: .Black, x: 6, y: 4, name: .Pawns)
var clFigures = [clFigure1, clFigure2, clFigure3]

func name(figure: ClFigure) -> String {
    return "\(figure.name) \(figure.color) \(figure.x) \(figure.y)"
}

for i in clFigures {
    print(name(figure: i))
}

func getFigure(i: Int, j: Int, figures: [ClFigure]) -> String {
    for fg in figures {
        switch fg.name {
        case .King where i == fg.x && j == fg.y:
            return fg.color == .White ? "\u{2654}" : "\u{265A}"
        case .Queen where i == fg.x && j == fg.y:
            return fg.color == .White ? "\u{2655}" : "\u{265B}"
        case .Knight where i == fg.x && j == fg.y:
            return fg.color == .White ? "\u{2657}" : "\u{265D}"
        case .Rook where i == fg.x && j == fg.y:
            return fg.color == .White ? "\u{2658}" : "\u{265E}"
        case .Bishope where i == fg.x && j == fg.y:
            return fg.color == .White ? "\u{2656}" : "\u{265C}"
        case .Pawns where i == fg.x && j == fg.y:
            return fg.color == .White ? "\u{2659}" : "\u{265F}"
            
        default: break
        }
    }
    
    return i % 2 == j % 2 ? "\u{25A1}" : "\u{25A0}"
}

//func
func descChess () -> () {
    var chess: String = ""
    for row in 1...8 {
        for line in 1...8 {
            chess = chess + getFigure(i: row, j: line, figures: clFigures)
        }
        chess = chess + "\n"
    }
    print(chess)
}

descChess()
print("////////////////////////////////////////")
func newPosition(figurePossition: inout ClFigure, possition: (x: Int, y: Int)) {
    if possition.x >= 1 && possition.x <= 8 && possition.y >= 1 && possition.y <= 8{
        switch figurePossition.name {
        case .King: figurePossition = ClFigure(color: figurePossition.color, x: possition.x, y:possition.y, name: figurePossition.name)
        case .Queen: figurePossition = ClFigure(color: figurePossition.color, x: possition.x, y:possition.y, name: figurePossition.name)
            
        case .Knight: figurePossition = ClFigure(color: figurePossition.color, x: possition.x, y:possition.y, name: figurePossition.name)
        case .Rook: figurePossition = ClFigure(color: figurePossition.color, x: possition.x, y:possition.y, name: figurePossition.name)
        case .Bishope: figurePossition = ClFigure(color: figurePossition.color, x: possition.x, y:possition.y, name: figurePossition.name)
        case .Pawns: figurePossition = ClFigure(color: figurePossition.color, x: possition.x, y:possition.y, name: figurePossition.name)
        }
    } else{
        print("wrong move")
    }
}

newPosition(figurePossition: &clFigures[1], possition: (7,1))

descChess()

print("///////////////////////////////////")
newPosition(figurePossition: &clFigures[2], possition: (10,3))
descChess()
