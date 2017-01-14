//1
let string = "Have you ever dreamed of running a bookshop? You can have a go for a week at the Open Book Store in Wigton, Scotland. In fact, if you book a holiday at the self-catering flat on Airbnb, you also have to work for 40 hours in the bookshop downstairs. A week in the flat costs 150. You wonít get paid for working, but you can use your own creative ideas to sell books and gain valuable experience. Wigton is Scotlandís national book town and this new venture is attracting interest from all over the world."

var letter = (vowel: 0, consonant: 0, numeral: 0, symbol: 0)

for i in string.characters {
    switch i {
    case "a", "e", "i", "o", "u", "y": letter.vowel = letter.vowel + 1
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z": letter.consonant = letter.consonant + 1
    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0": letter.numeral  = letter.numeral + 1
    default: letter.symbol  = letter.symbol + 1
    }
}
print("vowel - \(letter.vowel), consonant - \(letter.consonant), numeral - \(letter.numeral), symbol - \(letter.symbol)")

//2
let age = 26

switch age {
case 0...2: print("Baby - sleep and eat")
case 3...8: print("Child - kindergarten")
case 9...12: print("Schoolchild")
case 13...16: print("Teenager")
case 17...23: print("Student")
case 24...30: print("Worker")
case 31...45: print("Worker with big experience")
case 46...64: print("An employee in a managerial position")
case 65...80: print("Pensioner")
default: print("Hospital visitor")
}

//3
import Foundation
let student = (surname: "Тарасенко", name: "Валерия", patronymic: "Романовна")
print(student)
switch student {
case _ where student.name.hasPrefix("А") || student.name.hasPrefix("О"): print("Hay \(student.name)")
case _ where student.patronymic.hasPrefix("В") || student.patronymic.hasPrefix("Д"): print("Hay \(student.name) \(student.patronymic)")
case _ where student.surname.hasPrefix("Е") || student.surname.hasPrefix("З"): print("Hay \(student.surname)")
default: print("Hay \(student.surname) \(student.name) \(student.patronymic)")
}

//4
var ship1: [(x: String, y: Int)] = [("c", 2)]
var ship2: [(x: String, y: Int)] = [("g", 5)]
var ship3: [(x: String, y: Int)] = [("b", 7),("c",7)]
var shoot: (x: String, y: Int) = ("c",4)
switch shoot {
case _ where shoot.x == ship1[0].x && shoot.y == ship1[0].y: print("Killed")
case _ where shoot.x == ship2[0].x && shoot.y == ship2[0].y: print("Killed")
case _ where shoot.x == ship3[0].x && shoot.y == ship3[0].y: print("Wounted")
case _ where shoot.x == ship3[1].x && shoot.y == ship3[1].y: print("Wounted")
default: print("Missed")
}