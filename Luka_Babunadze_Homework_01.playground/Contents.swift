import Foundation
//***TASK 1***

//for number in 1...10{
//    if number % 2 == 0{
//        print(number, "Even")
//    } else {
//        print(number, "Odd")
//    }
//}

//var i = 1;
//while(i < 11){
//    if i % 2 == 0 {
//        print(i, "Even")
//    }else{
//        print(i, "Odd")
//    }
//    i += 1
//}


//var i = 1
//repeat {
//    if i % 2 == 0 {
//        print(i, "Even")
//    }else {
//        print(i, "Odd")
//    }
//    i += 1
//} while (i < 11)




//***TASK 2***
//var movies: [String] = ["Inception", "The Dark Knight", "Forrest Gump", "Interstellar", "The Matrix", "The Shawshank Redemption", "Pulp Fiction", "Avengers: Endgame", "Gladiator", "The Lion King"]
//
//for(index, movie) in movies.enumerated(){
//    if index % 3 == 0 {
//        print(index, movie.uppercased())
//    }else if(index % 4 == 0){
//        print(index, movie.capitalized)
//    }
//}
//
//movies.append("Mad Max: Fury Road")
//print(movies)


//***TASK 3***
//var grades: [String: Int] = ["Alice": 85, "Bob": 90, "Charlie": 78, "Max": 92]
//
//for (name, grad) in grades {
//    print(name, grad)
//}
//
//grades["David"] = 88
//print(grades)
//
//let person = grades.filter{$0.key == "Max"}
//let grad = person.values.first!
//print(grad)



//var grades: [(String, Int)] = [("Alice", 85), ("Max", 92), ("Mac Bookpro", 85), ("Gio", 100)]
//
//for (name, grad) in grades {
//    print(name, grad)
//}
//
//grades.append(("David", 88))
//print(grades)
//
//let person = grades.filter{$0.0 == "Gio"}
//print(person[0].1)


//***TASK 4***

//var data: (String, Int, String) = ("Ebeki", 4, "Rustavi")
//print(data.0)
//print(data.1)
//print(data.2)
//
//data.2 = "Tbilisi"
//print(data)

//***TASK 5***
//let products: [(String, Int)] = [("Butter", 10), ("Chocolate", 5), ("Milk", 15), ("Eggs", 8), ("Bread", 20)]
//var totalCost: Int = 0
//var name: String = ""
//
//for (prod, price) in products {
//    print(prod, price)
//    totalCost += price
//    name += prod + ", "
//}
//
//print("Items: \(name)")
//print("Total cost: \(totalCost)")
