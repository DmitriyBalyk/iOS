import UIKit

// 1.
func isEven(_ n: Int) -> Bool {
    return (n % 2 == 0)
}

// 2.
func isDividedBy3(_ n: Int) -> Bool {
    return (n % 3 == 0)
}

// 3. 
var sortedArr: Array<Int> = []
for i in 1...100 {
    sortedArr.append(i)
}
print(sortedArr)

// 4.
for (_, value) in sortedArr.enumerated() {
    if isEven(value) || !isDividedBy3(value) {
        sortedArr.remove(at: sortedArr.firstIndex(of: value)!)
    }
}
print(sortedArr)
