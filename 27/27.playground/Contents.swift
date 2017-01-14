protocol Food {
    var name: String { get }
    func taste() -> String
}

protocol Storable: Food {
    var expired: Bool { get }
    var daysToExpire: Int { get }
}

class Cake: Food {
    var name = "Cake"
    func taste() -> String {
        return "Sweet cake"
    }
}

class Persimmon: Food {
    var name = "Persimmon"
    func taste() -> String {
        return "Tart persimmon"
    }
}

class Milk: Storable {
    var name = "Milk"
    var expired = false
    var daysToExpire = 2
    func taste() -> String {
        return "Dairy milk"
    }
}

class Cheese: Storable {
    var name = "Cheese"
    var expired = false
    var daysToExpire = 4
    func taste() -> String {
        return "Blue cheese"
    }
}

func printFood(array: [Food]) {
    for i in array {
        print(i.taste())
    }
}


func foodSort(from array: [Food]) {
    let sortArray = array.sorted() {
        $0.name < $1.name
    }
    printFood(array: sortArray)
}

func toFridge(array: [Food]) {
    var fridge = [Storable]()
    for i in array {
        if let a = i as? Storable {
            if !a.expired {
                fridge.append(a)
            }
        }
    }
    
    fridge = fridge.sorted() {
        if $0.daysToExpire == $1.daysToExpire {
            return $0.name < $1.name
        } else {
            return $0.daysToExpire < $1.daysToExpire
        }
    }
    print("////////")
    printFood(array: fridge)
}

// func foodSortFridge(array: [Food]) -> [Food] {
//     let sortArray = array.sorted() {
//     if $0.daysToExpire = $1.daysToExpire {
//         $0.name < $1.name
//         } else {
//             $0.daysToExpire < $1.daysToExpire
//         }
//     }
// }

var cake = Cake()
var persimmon = Persimmon()
var milk = Milk()
var cheese = Cheese()
var bag: [Food] = [cake,persimmon,milk,cheese]

printFood(array: bag)
foodSort(from: bag)
toFridge(array: bag)

////5
//protocol Food {
//    var name: String { get }
//    func taste() -> String
//}
//
//protocol Storable {
//    //var name: String { get }
//    var expired: Bool {get}
//    var daysToExpire: Int {get}
//    //func taste() -> String
//}
//
//class Cake: Food {
//    var name = "Cake"
//    func taste() -> String {
//        return "Sweet cake"
//    }
//}
//
//class Persimmon: Food {
//    var name = "Persimmon"
//    func taste() -> String {
//        return "Tart persimmon"
//    }
//}
//
//class Milk: Food, Storable {
//    var name = "Milk"
//    var expired = false
//    var daysToExpire = 2
//    func taste() -> String {
//        return "Dairy milk"
//    }
//}
//
//class Cheese: Food, Storable {
//    var name = "Cheese"
//    var expired = false
//    var daysToExpire = 4
//    func taste() -> String {
//        return "Blue cheese"
//    }
//}
//
//func printFood(array: [Food]) {
//    for i in array {
//        print(i.taste())
//    }
//}
//
//
//func foodSort(from array: [Food]) {
//    let sortArray = array.sorted() {
//        $0.name < $1.name
//    }
//    printFood(array: sortArray)
//}
//
//func toFridge(array: [Food]) {
//    var fridge = [Storable]()
//    for i in array {
//        if let a = i as? Storable {
//            if !a.expired {
//                fridge.append(a)
//            }
//        }
//    }
//    
//    fridge = fridge.sorted() {
//        if $0.daysToExpire != $1.daysToExpire {
//            return $0.daysToExpire < $1.daysToExpire
//        } else {
//            let s1 = $0 as! Food
//            let s2 = $1 as! Food
//            return s1.name < s2.name
//        }
//    }
//    print("////////")
//    for i in fridge {
//        let s1 = i  as! Food
//        print(s1.taste())
//    }
//}
//
//
//var cake = Cake()
//var persimmon = Persimmon()
//var milk = Milk()
//var cheese = Cheese()
//var bag: [Food] = [cake,persimmon,milk,cheese]
//
//printFood(array: bag)
//foodSort(from: bag)
//toFridge(array: bag)