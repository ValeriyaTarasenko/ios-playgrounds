class Human {
    var name: String
    var father: Human?
    var mother: Human?
    var brother: [Human]?
    var sister: [Human]?
    
    var aunt: [Human] {
        var auntarray = [Human]()
        if let a = self.father?.sister {
            for i in a {
                auntarray.append(i)
            }
        }
        
        if let a = self.mother?.sister {
            for i in a {
                auntarray.append(i)
            }
        }
        
        return auntarray
    }
    var uncle: [Human] {
        var uncleArray = [Human]()
        if let a = self.father?.brother {
            for i in a {
                uncleArray.append(i)
            }
        }
        
        if let a = self.mother?.brother {
            for i in a {
                uncleArray.append(i)
            }
        }
        
        return uncleArray
    }
    var firstCousin: [Human] {
        var firstCousinArray = [Human]()
        for all in Human.CountH.humans {
            let uncleAunt = self.uncle + self.aunt
            if let m = all.mother {
                
                for i in uncleAunt {
                    if m === i {
                        firstCousinArray.append(all)
                    }
                }
            }
            if let m = all.father {
                //var uncleAunt = h1.uncle + h1.aunt
                for i in uncleAunt {
                    if m === i {
                        firstCousinArray.append(all)
                    }
                }
            }
        }
        
        return firstCousinArray
    }
    var secondCousin = [Human]()
    // var firstCousinM = [Human]()
    // var secondCousinM = [Human]()
    var animal: [Animal]?
    struct CountH {
        static var count =  1
        static var humans = [Human]()
    }
    init(name: String) {
        self.name = name
        CountH.humans.append(self)
    }
}

class Man: Human {
    func Move() {
        print("\(self.name) move sofa")
    }
}

class Woman: Human {
    func SayMove() {
        print("\(self.name) say move sofa")
    }
    
}

class Animal {
    func Scream() {
        print("Aaaaaaaaaa")
    }
}

class Cat: Animal {
    override func Scream() {
        print("Meow")
    }
}

class Dog: Animal {
    override func Scream() {
        print("Woof")
    }
}

class Fish: Animal {
    override func Scream() {
        print("Bool-bool")
    }
}

var h1 = Man(name: "man1")
var h2 = Man(name: "man2")
var h3 = Man(name: "man3")
var h4 = Man(name: "man4")
var h5 = Man(name: "man5")
var h6 = Man(name: "man6")
var h7 = Man(name: "man7")
var h8 = Man(name: "man8")
var h9 = Man(name: "man9")
var h10 = Man(name: "man10")
var h11 = Man(name: "man11")
var h12 = Man(name: "man12")
var h13 = Man(name: "man13")
var h14 = Man(name: "man14")
var h15 = Man(name: "man15")
var h16 = Woman(name: "woman1")
var h17 = Woman(name: "woman2")
var h18 = Woman(name: "woman3")
var h19 = Woman(name: "woman4")
var h20 = Woman(name: "woman5")
var h21 = Woman(name: "woman6")
var h22 = Woman(name: "woman7")
var h23 = Woman(name: "woman8")
var h24 = Woman(name: "woman9")
var h25 = Woman(name: "woman10")
var h26 = Woman(name: "woman11")
var h27 = Woman(name: "woman12")
var h28 = Woman(name: "woman13")
var h29 = Woman(name: "woman14")
var h30 = Woman(name: "woman15")

var countMan = 0
var countWoman = 0
for all in Human.CountH.humans {
    if let a = all as? Man {
        countMan = countMan + 1
        a.Move()
    } else if let b = all as? Woman {
        countWoman = countWoman + 1
        b.SayMove()
    }
}

print("man - \(countMan) woman - \(countWoman)")

////1
h1.mother = h16
h1.father = h2
h1.brother = [h3,h4]
h1.sister = [h17]

h3.mother = h16
h3.father = h2
h3.brother = [h2,h4]
h3.sister = [h17]

h4.mother = h16
h4.father = h2
h4.brother = [h2,h3]
h4.sister = [h17]

h17.mother = h16
h17.father = h2
h17.brother = [h1,h2,h3]
//2
h16.mother = h18
h16.father = h5
h16.brother = [h6]

h6.mother = h18
h6.father = h5
h6.sister = [h16]
//3
h2.mother = h19
h2.father = h7
h2.brother = [h8]
h2.sister = [h20]

h8.mother = h19
h8.father = h7
h8.brother = [h2]
h8.sister = [h20]

h20.mother = h19
h20.father = h7
h20.brother = [h2,h8]
//4
h9.father = h6
h9.mother = h21
h9.sister = [h22]

h22.father = h6
h22.mother = h21
h22.brother = [h9]

h1.animal = [Cat()]
h18.animal = [Cat(),Dog()]
h22.animal = [Dog()]
h20.animal = [Fish(),Cat()]
for i in h1.firstCousin {
    print(i.name)
}

var allAnimal = [Animal]()
for all in Human.CountH.humans {
    if let a = all.animal {
        for an in a {
            allAnimal.append(an)
        }
    }
}

var countCat = 0
var countDog = 0
var countFish = 0
for animal in allAnimal {
    if let cat = animal as? Cat {
        countCat = countCat + 1
        cat.Scream()
    } else if let dog = animal as? Dog {
        countDog = countDog + 1
        dog.Scream()
    } else if let fish = animal as? Fish {
        countFish = countFish + 1
        fish.Scream()
    }
}
print("cat - \(countCat) dog - \(countDog) fish - \(countFish)")