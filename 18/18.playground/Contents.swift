//1
class Artist {
    var name: String
    var surname: String
    
    func action() {
        print("Artist \(name) \(surname) perfomens")
    }
    
    init(name: String, surname: String) {
        self.name = name
        self.surname = surname
    }
}

class Dancer: Artist {
    override func action() {
        print("Dancer \(name) \(surname) perfomens")
    }
}

class Painter: Artist {
    override func action() {
        self.name = "Painter"
        self.surname = "Painter"
        print("\(name) \(surname) perfomens")
    }
}

var artist = Artist(name: "Vasya", surname: "Sidorov")
var danser = Dancer(name: "Kolya", surname: "Ivanov")
var painter = Painter(name: "Lesha", surname: "Petrov")
for i in [artist, danser, painter] {
    i.action()
}

//2
class Vehicle {
    var speed: Int {return 150}
    var capacity: Int {return 200}
    var cost: Int {return 50}
    
    func calculation(people: Int, distance: Int) {
        let time = distance/speed // * (people/capacity==1 ? 1 : (people/capacity)*2)
        let allCost = people * cost
        print("Count people \(people) costs \(allCost) time \(time)")
    }
}

class Plane: Vehicle {
    override var speed: Int { return 700 }
    override var capacity: Int { return 300 }
    override var cost: Int { return 150 }
}

class Car: Vehicle {
    override var speed: Int { return 120 }
    override var capacity: Int { return 5 }
    override var cost: Int { return 30 }
}

class Train: Vehicle {
    override var speed: Int { return 250 }
    override var capacity: Int { return 300 }
    override var cost: Int { return 10 }
}

var transport = [Plane(), Car(), Train()]
for i in transport {
    i.calculation(people: 100, distance: 1000)
}


//3
class Creature {}

class Animal: Creature {}
class Reptile: Animal {}
class Quadruped: Animal {}
class Crocodile: Reptile {}
class Human: Quadruped {}
class Dog: Quadruped {}
class Lizard: Reptile {}
class Giraffe: Quadruped {}
class Monkey: Quadruped {}

var cr1 = Crocodile()
var cr2 = Lizard()
var cr3 = Human()
var cr4 = Human()
var cr5 = Dog()
var cr6 = Dog()
var cr7 = Giraffe()
var cr8 = Giraffe()
var cr9 = Lizard()
var cr10 = Lizard()

var creatures : [Creature] = [cr1,cr2,cr3,cr4,cr5,cr6,cr7,cr8,cr9,cr10]
//var creatures = [Crocodile(),Lizard(),Human(),Human(),Dog(),Dog(),Giraffe(),Giraffe(),Lizard(),Lizard()]
var quad = 0
var an = 0
var cr = 0
for i in creatures {
    if i is Quadruped {
        quad = quad + 1
    }
    if i is Animal {
        an = an + 1
    }
    if i is Creature {
        cr = cr + 1
    }
}

print("creatures - \(cr), animals - \(an), quadruped - \(quad)")