//1
struct Field {
    //var dict = [String: String]()
    var letters = "abcdefgh"
    subscript(column: String, row: Int) -> String? {
        get {
            var index = 0
            for (i, j) in letters.characters.enumerated() {
                if String(j) == column {
                    index = i + 1
                }
            }
            if 1...8 ~= row && 1...8 ~= index {
                return row % 2 == index % 2 ? "\u{25A1}" : "\u{25A0}"
            } else {
                return nil
            }
        }
    }
    
}

var field = Field()
print(field["a", 6])

//2
struct Tic {
    //var XY: (Int, Int)
    enum Figure : String {
        case X = "\u{274E}"
        case O = "\u{2b55}"
        case Empty = "\u{2b1c}"
    }
    
    var column: Int
    var row: Int
    var arr: [Figure]
    init(column: Int, row: Int) {
        self.column = column
        self.row = row
        arr = Array(repeating: .Empty, count: column * row)
    }
    
    func printField() {
        print("/////////////")
        var line: String = ""
        for (index, value) in arr.enumerated() {
            if (index) % row == 0 {
                print(line)
                line = value.rawValue//isFigure(figure: value)
            } else {
                line = line + value.rawValue//isFigure(figure: value)
            }
        }
        print(line)
    }
    
    mutating func cleanField() {
        arr.self = Array(repeating: .Empty, count: column * row)
    }
    
    subscript(columns: Int, rows: Int) -> Figure? {
        get {
            if 1...column ~= columns && 1...row ~= rows {
                return arr[columns+rows-2]
            } else {
                return nil
            }
        }
        
        set {
            if 1...column ~= columns && 1...row ~= rows && arr[rows + columns - 2] == .Empty, let nv = newValue {
                arr[(rows-1)*column + columns - 1] = nv
            }
        }
    }
    
}

var ticField = Tic(column: 3, row: 3)
ticField.printField()
ticField[1,1] = Tic.Figure.X
ticField.printField()
ticField[1,2] = Tic.Figure.O
ticField.printField()
ticField[2,1] = Tic.Figure.O
ticField.printField()
ticField.cleanField()
ticField.printField()