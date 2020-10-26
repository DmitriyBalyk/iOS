import UIKit

// ax^2 + bx + c = 0

var x1 = 0.0
var x2 = 0.0
var d = 0.0
 
let a = 1.0
let b = -8.0
let c = 12.0
 
d = b * b - 4 * a * c
 
if d > 0 {
    x1 = (-b + sqrt(d)) / (2 * a)
    x2 = (-b - sqrt(d)) / (2 * a)
    print("X1 = \(x1); X2 = \(x2)")
} else if d == 0 {
    x1 = (-b + sqrt(d)) / (2 * a)
    print("X1 = X2 = \(x1)")
} else {
    print("Не имеет корней")
}

/*
 Задание №2
*/

var a1 = 6.0
var b1 = 3.0

var s = (a1 * b1) / 2
var c1 = sqrt(pow(a1, 2) + pow(b1, 2))
var p = a1 + b1 + c1
print("""
    Площадь треугольника s = \((s*100).rounded() / 100)
    Гипотенуза с = \((c1*100).rounded() / 100)
    Периметр P = \((p*100).rounded() / 100)\n
    """)
/*
 Задание №3
 */

var deposit = 30_000.0
var percent = 7.5

print("Рассчет суммы вклада за весь период:")

for number in 1...5 {
    let profit = (deposit * percent) / 100
    deposit += profit
    print("\(number) год - \((deposit*100).rounded() / 100) рублей")
}
