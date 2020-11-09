import UIKit

    struct Queue<T> {
        private var something: [T] = []
        
        mutating func enqueue(_ two: T) {
            something.append(two)
    }
        
    mutating func dequeue() -> T? {
        guard something.isEmpty == false else { return nil }
        return something.removeFirst()
    }

            subscript(_ index: Int) -> T? {
                if index > something.count - 1 { return nil }
                return something[index]
            }
        }
var int = Queue<Int>()
int.enqueue(1)
int.enqueue(2)
int.enqueue(3)
print(int)
    _ = int[3] // возвращает nil, так как индекса не существует

var str = Queue<String>()
str.enqueue("3")
str.enqueue("2")
str.enqueue("1")
print(str)
str.dequeue()
str.dequeue()
str.dequeue()
str.dequeue()


func lineAddition(elements: [String], operation: ([String]) -> String) -> String {
    return operation(elements)
}

lineAddition(elements: ["Привет!", " ", "Как дела?"]) { elements in
    var result: String = ""
    elements.forEach { element in
        result += element
    }
    return result
}

// Метод добавления строк в массив
func addToArray(elements: [String], operation: ([String]) -> [String]) -> [String] {
    return operation(elements)
}

addToArray(elements: ["Hey!", " ", "How are you doing?"]) { elements in
    var result: [String] = []
    elements.forEach { element in
        result.append(element)
    }
    return result

}

func getText() -> String { return "text"}
getText()
