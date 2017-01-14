enum Color : String {
    case Black = "Black"
    case White = "White"
}

enum FigureName : String {
    case King    = "King"
    case Queen   = "Queen"
    case Knight  = "Knight"
    case Rook    = "Rook"
    case Bishope = "Bishope"
    case Pawns   = "Pawns"
}

enum Figure {
    case King(color: Color, x: Int, y: Int, name: FigureName)
    case Queen(color: Color, x: Int, y: Int, name: FigureName)
    case Knight(color: Color, x: Int, y: Int, name: FigureName)
    case Rook(color: Color, x: Int, y: Int, name: FigureName)
    case Bishope(color: Color, x: Int, y: Int, name: FigureName)
    case Pawns(color: Color, x: Int, y: Int, name: FigureName)
}

let figure1 = Figure.King(color: .Black, x: 4, y: 2, name: .King)
let figure2 = Figure.Queen(color: .White, x: 1, y: 7, name: .Queen)
let figure3 = Figure.Pawns(color: .Black, x: 6, y: 4, name: .Pawns)
var figures = [figure1, figure2, figure3]
//print(figures)

func name(figure : Figure) -> String {
    switch figure {
    case .King (let color, let x, let y, let name):
        return "\(name) \(color) \(x) \(y)"
    case .Queen (let color, let x, let y, let name):
        return "\(name) \(color) \(x) \(y)"
    case .Knight (let color, let x, let y, let name):
        return "\(name) \(color) \(x) \(y)"
    case .Rook (let color, let x, let y, let name):
        return "\(name) \(color) \(x) \(y)"
    case .Bishope (let color, let x, let y, let name):
        return "\(name) \(color) \(x) \(y)"
    case .Pawns (let color, let x, let y, let name):
        return "\(name) \(color) \(x) \(y)"
    }
}

func getFigure(i: Int, j: Int, figures: [Figure]) -> String {
    for fg in figures{
        switch fg {
        case .King (let color, let x, let y, _) where i == x && j == y:
            return color == .White ? "\u{2654}" : "\u{265A}"
        case .Queen (let color, let x, let y, _)where i == x && j == y:
            return color == .White ? "\u{2655}" : "\u{265B}"
        case .Knight (let color, let x, let y, _) where i == x && j == y:
            return color == .White ? "\u{2657}" : "\u{265D}"
        case .Rook (let color, let x, let y, _) where i == x && j == y:
            return color == .White ? "\u{2658}" : "\u{265E}"
        case .Bishope (let color, let x, let y, _)where i == x && j == y:
            return color == .White ? "\u{2656}" : "\u{265C}"
        case .Pawns (let color, let x, let y, _) where i == x && j == y:
            return color == .White ? "\u{2659}" : "\u{265F}"
            
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
            chess = chess + getFigure(i: row, j: line, figures: figures)
        }
        chess = chess + "\n"
    }
    print(chess)
}

descChess()

func newPosition(figurePossition: inout Figure, possition: (x: Int, y: Int)) {
    if possition.x >= 1 && possition.x <= 8 && possition.y >= 1 && possition.y <= 8{
        switch figurePossition {
        case .King(let color, _, _, let name): figurePossition = .King(color: color, x: possition.x, y: possition.y, name: name)
        case .Queen(let color, _, _, let name): figurePossition = .Queen(color: color, x: possition.x, y: possition.y, name: name)
        case .Knight(let color, _, _, let name): figurePossition = .Knight(color: color, x: possition.x, y: possition.y, name: name)
        case .Rook(let color, _, _, let name): figurePossition = .Rook(color: color, x: possition.x, y: possition.y, name: name)
        case .Bishope(let color, _, _, let name): figurePossition = .Bishope(color: color, x: possition.x, y: possition.y, name: name)
        case .Pawns(let color, _, _, let name): figurePossition = .Pawns(color: color, x: possition.x, y: possition.y, name: name)
        }
    } else{
        print("wrong move")
    }
}

newPosition(figurePossition: &figures[1], possition: (7,1))

print("///////////////////////////////////")

descChess()

print("///////////////////////////////////")
newPosition(figurePossition: &figures[2], possition: (10,3))
descChess()