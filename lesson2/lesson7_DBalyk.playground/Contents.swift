import UIKit

enum AutomatCoffeeError: Error {
    case noWater
    case noCoffee
    case noMilk
    case noSugar
    case invalidSelection
    case outOfStock
    case noMoney (coinsNeeded: Int) 
}

struct AutomatCoffe: CustomStringConvertible {
    var description: String
}
struct Coffee {
    let price: Int
    var count: Int
    let product: Product
}
struct Product {
    var name: String
    let coffeeNeeded : Int
    let milkNeeded : Int
    let waterNeeded : Int
    let sugarNeeded : Int
    init(nameOf name: String,
         coffeeNeeded coffee3 : Int = 30,
         milkNeeded milk : Int = 60,
         waterNeeded water : Int = 60,
         sugarNeeded sugar : Int = 10
    )
    {
        self.name = name
        self.coffeeNeeded = coffee3
        self.milkNeeded = milk
        self.waterNeeded = water
        self.sugarNeeded = sugar
    }
}
var water = 50
var coffee3 = 40
var milk = 130
var sugar = 40

var description: String {
    return ("""
        Ресурс воды: \(water)\n
        Ресурс кофейных зерен: \(coffee3)\n
        Ресурс молока: \(milk)\n
        Ресурс сахара: \(sugar)\n
        """)
}

class AutomatMachine {
    
    private(set) var inventory = [
        "Americana" : Coffee(price: 70, count: 11, product: Product(nameOf: "Americana",
                                                                    coffeeNeeded: 30,
                                                                    milkNeeded: 0,
                                                                    waterNeeded: 30,
                                                                    sugarNeeded: 30)),
        "Cappuccino" : Coffee(price: 90, count: 5, product: Product(nameOf: "Cappuccino",
                                                                    coffeeNeeded: 30,
                                                                    milkNeeded: 60,
                                                                    waterNeeded: 60,
                                                                    sugarNeeded: 30)),
        "Espresso" : Coffee(price: 50, count: 1, product: Product(nameOf: "Espresso",
                                                                  coffeeNeeded: 15,
                                                                  milkNeeded: 0,
                                                                  waterNeeded: 30,
                                                                  sugarNeeded: 0)),
        "Latte" : Coffee(price: 110, count: 50, product: Product(nameOf: "Latte",
                                                                 coffeeNeeded: 30,
                                                                 milkNeeded: 120,
                                                                 waterNeeded: 60,
                                                                 sugarNeeded: 10))
    ]
    
    var deposite: Int = 0
    
    func vend(coffee name: String) throws -> Product {
        guard var coffee = inventory[name] else { throw AutomatCoffeeError.invalidSelection }
        guard coffee.count > 0 else { throw AutomatCoffeeError.outOfStock }
        guard coffee.price <= deposite else {
            throw AutomatCoffeeError.noMoney(coinsNeeded: coffee.price - deposite)}
        guard milk - coffee.product.milkNeeded > 0 else { throw AutomatCoffeeError.noMilk }
        guard water > 0 else { throw AutomatCoffeeError.noWater }
        guard sugar > 0 else { throw AutomatCoffeeError.noSugar }
        guard coffee3 > 0 else { throw AutomatCoffeeError.noCoffee }

        deposite -= coffee.price
        coffee.count -= 1
        print("Получите товар: \(coffee.product.name)")
        return coffee.product
    }
}

var automat = AutomatMachine()

automat.deposite = 150


do {
    try automat.vend(coffee: "Latte")
} catch AutomatCoffeeError.invalidSelection {
    print("Данного товара нет в списке предложенных")
} catch AutomatCoffeeError.outOfStock {
    print("Товар закончился")
} catch AutomatCoffeeError.noMoney(let coinsNeeded) {
    print("Необходимо внести \(coinsNeeded) монет")
} catch AutomatCoffeeError.noWater {
    print("Закончилась вода")
} catch AutomatCoffeeError.noCoffee {
    print("Закончились зерна")
} catch AutomatCoffeeError.noMilk {
    print("Закончилось молоко")
} catch AutomatCoffeeError.noSugar {
    print("Закончился сахар")
} catch {
    print(error.localizedDescription)
}
