//Task N1
func factorial(n: Int?) -> Int?{
   guard let n = n else {
        return nil
    }
    guard n >= 0 else {
        print("n is negative")
        return nil
    }
    
    var sum = 1
    for number in 1...n {
        sum *= number
    }
    
    return sum;
}

factorial(n: 10)




// Task N2
struct Student {
    var name: String
    var grades: [Double]
    
    func averageGrade () -> Double{
        let total = grades.reduce(0, +)
        return total / Double(grades.count)
    }
}

func averageGrade(for student: Student, inClass classList: [String: Student]) -> Double {
    return student.averageGrade()
}

func bestStudent(for student: Student, inClass classList: [String: Student]) -> (Student, Double) {
    var bestStudent = student
    var highestAverage = student.averageGrade()
    
    for (_, currentStudent) in classList {
        let currentAverage = currentStudent.averageGrade()
        if currentAverage > highestAverage {
            bestStudent = currentStudent
            highestAverage = currentAverage
        }
    }
    
    return (bestStudent, highestAverage)
}

let students = [
    "Alice": Student(name: "Alice", grades: [5.0, 1.5, 2.75]),
    "Bob": Student(name: "Bob", grades: [5.25, 3.75, 5.75]),
    "Charlie": Student(name: "Charlie", grades: [6.0, 6.5, 5.0])
]

let best = bestStudent(for: students["Alice"]!, inClass: students)
print("Best student is \(best.0.name), average grade - \(best.1)")

let averageAlice = averageGrade(for: students["Alice"]!, inClass: students)
print("Alice's grade is \(averageAlice)")


// Task N3

let myArray: [String] = ["aha", "ahaha", "ahahaha", "ahahahahah"]


func findLongestWord(in array: [String?]) -> String?{
    var longest = ""
    guard !array.isEmpty else {
        return nil;
    }
    
    for word in array.enumerated(){
        guard let w = word.element else{
            return nil
        }
        if w.count > longest.count {
            longest = w
        }
    }
    
    return longest
}

print(findLongestWord(in: myArray))


// Task N4

struct ShoppingItem {
    var name: String
    var quantity: Int
    var isPurchased: Bool
 
    init(name: String = "no name", quantity: Int = 1, isPurchased: Bool = false) {
        self.name = name
        self.quantity = quantity
        self.isPurchased = isPurchased
    }
}

struct ShoppingList {
    var items: [String: ShoppingItem] = [:]
    
    mutating func addItem(_ item: ShoppingItem) {
        items[item.name] = item
    }
    
    mutating func markAsPurchased(itemName: String){
        if var item = items[itemName]{
            item.isPurchased = true
            items[itemName] = item
        }
    }
    
    mutating func markAsPurchased(item: ShoppingItem){
        if var item = items[item.name]{
            item.isPurchased = true
            items[item.name] = item
        }
    }
    
    mutating func listUnpurchasedItems() -> [ShoppingItem]{
        return items.values.filter { !$0.isPurchased }
    }
}

var shoppingList = ShoppingList()

shoppingList.addItem(ShoppingItem(name: "Milk", quantity: 2))
shoppingList.addItem(ShoppingItem(name: "Bread", quantity: 1))
shoppingList.addItem(ShoppingItem(name: "Eggs", quantity: 12))

shoppingList.markAsPurchased(itemName: "Milk")
print(shoppingList)

let unpurchasedItems = shoppingList.listUnpurchasedItems()
for item in unpurchasedItems {
    print("\(item.name) - Quantity: \(item.quantity) - Purchased: \(item.isPurchased)")
}
