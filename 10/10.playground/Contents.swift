//1
func returnSimbol1() -> String {
    return "\u{0468}"
}

func returnSimbol2() -> String {
    return "\u{06E9}"
}

func returnSimbol3() -> String {
    return "\u{03D6}"
}

print(returnSimbol1()+returnSimbol2()+returnSimbol3())

//2

func desc(i: Int,j: Int) -> String {
    if (i % 2 == 0 && j % 2 != 0) || (i % 2 != 0 && j % 2 == 0) {
        return "\u{25A0}"
    } else {
        return"\u{25A1}"
    }
}

var chess: String = ""
for row in 1...8 {
    for line in 1...8 {
        chess = chess + desc(i: row, j: line)
    }
    chess = chess + "\n"
}
print(chess)

print(desc(i: 3, j: 2))

//3
func array (inArray: [Any]) -> [Any] {
    var outArray = [Any]()
    for i in inArray {
        outArray.insert(i, at: 0)
    }
    return outArray
}

func returnSequence(sequence: Any...) -> [Any] {
    return array(inArray: sequence)
}

let inArray = [1,5,8]
print(array(inArray: inArray))
print(returnSequence(sequence: 1,2,3,4,5))

//4
 func arrayNew (inArray1: inout [Int]) {
     var outArray1 = [Int]()
     for i in inArray1 {
         outArray1.insert(i, at: 0)
     }
     inArray1 = outArray1
 }

 var inArray1 = [1,5,8]
 arrayNew(inArray1: &inArray1)
 print(inArray1)

//5
func transfer(text: String) -> String {
    var symbol: String = ""
    let numbers = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    for i in text.characters {
        switch i {
        case "a", "e", "i", "o", "u", "y": symbol += String(i).uppercased()
        case "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Z": symbol += String(i).lowercased()
        case "0"..."9": symbol += numbers[Int(String(i))!]
        case ".",",","'","?","!": symbol += ""
        default: symbol += String(i)
        }
    }
    return symbol
}


let text = "Have you ever dreamed of running a bookshop? You can have a go for a week at the Open Book Store in Wigton, Scotland. In fact, if you book a holiday at the self-catering flat on Airbnb, you also have to work for 40 hours in the bookshop downstairs. A week in the flat costs 150. You wonít get paid for working, but you can use your own creative ideas to sell books and gain valuable experience. Wigton is Scotlandís national book town and this new venture is attracting interest from all over the world."
let a = transfer(text: text)
print(a)