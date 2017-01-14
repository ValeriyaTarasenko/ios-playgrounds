class FamilyMember {
    
}

class Father: FamilyMember {
    var name: String
    weak var wife: Mother?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Deinit \(name)")
    }
    
    var printFamily: () -> () = {
        
    }
    
    var printMother: () -> () = {

    }
    
    var printChilren: () -> () = {
        
    }
}

class Mother: FamilyMember {
    
    var name: String
    var husband: Father
    weak var child1: Child?
    weak var child2: Child?
    
    init(name: String, husband: Father) {
        self.name = name
        self.husband = husband
    }
    
    deinit {
        print("Deinit \(name)")
    }
}

class Child: FamilyMember {
    var name: String
    var father: Father
    var mother: Mother
    weak var child: Child?
    
    init(name: String, father: Father, mother: Mother) {
        self.name = name
        self.father = father
        self.mother = mother
    }
    
    deinit {
        print("Deinit \(name)")
    }
}

class Family {
    private var array: [FamilyMember]
    
    func getFamily() -> [FamilyMember] {
        return array
    }
    
    init() {
        self.array = [FamilyMember]()
    }
    
    func append(member: FamilyMember) {
        array.append(member)
    }
}

var family = Family()
var father = Father(name: "Kolya")
var mother = Mother(name: "Lera", husband: father)
var child = Child(name: "Expa", father: father, mother: mother)

father.printMother()
child = Child(name: "fff", father: father, mother: mother)