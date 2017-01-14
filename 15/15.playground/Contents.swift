import Foundation

// 1
struct File {
    static let maxSize = 200
    
    var name: String
    var pathFolder: String
    var visible: Bool
    var text: String
    
    var size: Int {
        didSet {
            if size > File.maxSize {
                print("Error!")
            }
        }
    }
    
    var pathFile: String {
        //return pathFolder + "'\'" + name
        return "\(pathFolder)/\(name)"
    }
    
}

let file = File(name: "File", pathFolder: "C:", visible: true, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", size: 100)

print(file.pathFile)

//2
enum Color: Int {
    static let counColors = 100
    static let startColor = Color.White
    static let endColor = Color.Black
    
    case White = 0xFFFFFF
    case Black = 0x000000
    case Yellow = 0xFFFF00
    case Green = 0x009933
}

//3

class Human {
    static let maxAge = 150
    static let minAge = 0
    static let maxLanght = 20
    static let minLanght = 3
    static let minWeight = 120
    static let minHeight = 40
    static var totalHuman = 0
    
    var name: String {
        didSet{
            // countElements(name) == Human.minLanght...Human.maxLanght ? name : oldValue
            //name.count == Human.minLanght...Human.maxLanght ? name : oldValue
            if name.characters.count >  Human.maxLanght &&  name.characters.count < Human.minLanght {
                name = oldValue
                print(name.characters.count)
            }
        }
    }
    var surname: String {
        didSet{
            if surname.characters.count > Human.maxLanght && surname.characters.count < Human.minLanght {
                surname = oldValue
            }
        }
    }
    var age: Int {
        didSet{
            if age >  Human.maxAge && age < Human.minAge {
                age = oldValue
            }
        }
    }
    var height: Int {
        didSet{
            if height < Human.minHeight {
                height = oldValue
            }
        }
    }
    var weight: Int {
        didSet{
            if weight < Human.minWeight {
                weight = oldValue
            }
        }
    }
    
    init(name: String, surname: String, age: Int, height: Int, weight: Int){
        self.name    = name
        self.surname = surname
        self.age     = age
        self.height  = height
        self.weight  = weight
        
        Human.totalHuman = Human.totalHuman + 1
    }
    
}


let humen1 = Human(name: "Lera", surname: "Tarasenko", age: 25, height: 158, weight: 45)
print(humen1)

let humen2 = Human(name: "LongNameLongNameLongNameLongName", surname: "LongSurnameLongSurnameLongSurname", age: 19, height: 175, weight: 70)
print(humen2.name)
let humen3 = Human(name: "Vasya", surname: "Petrov", age: 180, height: 180, weight: 110)

let humen4 = Human(name: "Petya", surname: "Vasiliev", age: 47, height: 167, weight: 35)

print(Human.totalHuman)