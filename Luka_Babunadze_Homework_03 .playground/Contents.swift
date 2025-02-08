//TASK 1

protocol Shape {
    func area () -> Double
}

extension Shape {
    var description: String {
        return "Shape"
    }
}

struct Rectangle: Shape {
    let length: Double
    let width: Double
    
    func area() -> Double {
        return length * width
    }
    
    var description: String {
        return "Rectangle"
    }
}

struct Circle: Shape {
    let radius: Double
    
    func area() -> Double {
        return .pi * radius * radius
    }
    
    var description: String {
        return "Circle"
    }
}


let rect = Rectangle(length: 10, width: 20)
let circle = Circle(radius: 30)
print(rect.area())
print(rect.description)
print(circle.area())
print(circle.description)

let shapes: [Shape] = [
    Rectangle(length: 7, width: 10),
    Circle(radius: 5),
    Rectangle(length: 3, width: 4),
    Circle(radius: 2)
]

let totalArea = shapes.reduce(0){$0 + $1.area()}
print(totalArea)

//TASK 2

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func greet() -> String {
        return "Hi, I'm \(self.name) and I'm \(self.age) years old."
    }
    
    
}

print(Person(name: "John", age: 30).greet())

class Employee: Person {
    var jobTitle: String
    
    init(jobTitle: String, name: String, age: Int) {
        self.jobTitle = jobTitle
        super.init(name: name, age: age)
    }
    
    override func greet() -> String{
        return "Hi, I'm \(self.name), a \(self.jobTitle), and I'm \(self.age) years old."
    }
    
}

print(Employee(jobTitle: "Software Engineer", name: "John", age: 30).greet())


//TASK 3

protocol Appliance {
    var powerUsage: Double {get set}
    
    func calculateMonthlyConsumption(hours: Double) -> Double
}

extension Appliance {
    func calculateMonthlyConsumption(hours: Double) -> Double {
        return (hours * self.powerUsage) / 1000
    }
}

extension Appliance {
    
    var description: String {
        return "Power usage: \(self.powerUsage) W"
    }
}

struct WashingMachine: Appliance {
    var powerUsage: Double = 500
}

struct Refridgerator: Appliance {
    var powerUsage: Double = 100
}

let washingMachine = WashingMachine()
let refrigerator = Refridgerator()

print("Washing machine monthly consumption: \(washingMachine.calculateMonthlyConsumption(hours: 100)) kWh")
print("Refrigerator monthly consumption: \(refrigerator.calculateMonthlyConsumption(hours: 200)) kWh")


//TASK 4

struct Book {
    var title: String
    var author: String
}

protocol Borrowable {
    
    func borrow(bookTitle: String) -> Book?
    func returnBook(_ book: Book)
    
}

class Library: Borrowable {
    private var books: [Book] = []
    
    func addBook(_ book: Book) {
            books.append(book)
            print("Added '\(book.title)' by \(book.author) to the library.")
        }
    
    func removeBook(_ bookTitle: String) {
            if let index = books.firstIndex(where: { $0.title == bookTitle }) {
                let removedBook = books.remove(at: index)
                print("Removed '\(removedBook.title)' by \(removedBook.author) from the library.")
            } else {
                print("Book '\(bookTitle)' not found in the library.")
            }
        }
    
    func borrow(bookTitle: String) -> Book? {
            if let index = books.firstIndex(where: { $0.title == bookTitle }) {
                let borrowedBook = books.remove(at: index)
                print("You borrowed '\(borrowedBook.title)'.")
                return borrowedBook
            } else {
                print("Book '\(bookTitle)' is not available.")
                return nil
            }
        }

    func returnBook(_ book: Book) {
        books.append(book)
        print("You returned '\(book.title)'.")
    }
}

extension Library {
    func listBooks() -> String{
        return "These are the all books that we keep in our library: \(self.books)"
    }
}

let book1 = Book(title: "Swift Programming", author: "Apple Inc.")
let book2 = Book(title: "The Pragmatic Programmer", author: "Andrew Hunt")

let myLibrary = Library()
myLibrary.addBook(book1)
myLibrary.addBook(book2)
print(myLibrary.listBooks())

if let borrowedBook = myLibrary.borrow(bookTitle: "Swift Programming") {
    myLibrary.returnBook(borrowedBook)
}
