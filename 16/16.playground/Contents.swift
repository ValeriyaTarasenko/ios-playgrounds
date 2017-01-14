
struct Room {
    var w: Int
    var h: Int
    var man: Human
    var box: Box
    var point: Point
    
    func startRoom() {
        for i in 1...w {
            var place = ""
            for j in 1...h {
                if i == 1 || i == w || j == 1 || j == h {
                    place = place + "\u{25A0}"
                } else if man.x == i && man.y == j {
                    place = place + "\u{265B}"
                } else if box.x == i && box.y == j {
                    place = place + "\u{265F}"
                } else if point.x == i && point.y == j {
                    place = place + "\u{1CF5}"
                } else {
                    place = place + "\u{25A1}"
                }
            }
            print(place)
        }
    }
    
    mutating func moveHuman(moveMan: Move) {
        var newX = man.x
        var newY = man.y
        var newXBox = box.x
        var newYBox = box.y
        switch moveMan {
        case .Left:
            newX = man.x - 1
        // newXBox = box.x - 1
        case .Right:
            newX = man.x + 1
        //newXBox = box.x + 1
        case .Up:
            newY = man.y + 1
        //newYBox = box.y + 1
        case .Down:
            newY = man.y - 1
            //newYBox = box.y - 1
        }
        // if (newX in 2...(w - 1) && newY in 2...(h - 1)) {
        if newX == box.x && newY == box.y {
            newXBox = newXBox + newX - man.x
            newYBox = newYBox + newY - man.y
        }
        if 2...(w - 1) ~= newX && 2...(h - 1) ~= newY && 2...(w - 1) ~= newXBox && 2...(h - 1) ~= newYBox {
            self.man.x = newX
            self.man.y = newY
            self.box.x = newXBox
            self.box.y = newYBox
        }
    }
}

struct Human {
    var x: Int
    var y: Int
}

struct Box {
    var x: Int
    var y: Int
}

struct Point {
    var x: Int
    var y: Int
}
enum Move {
    case Left
    case Right
    case Up
    case Down
}

var create = Room(w: 10, h: 7, man: Human(x: 4, y: 2), box: Box(x: 5, y: 3), point: Point(x: 3, y: 2))
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Right)
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Right)
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Up)
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Left)
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Left)
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Up)
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Left)
create.startRoom()
print("////////////////////////////////////////")
create.moveHuman(moveMan: .Down)
create.startRoom()