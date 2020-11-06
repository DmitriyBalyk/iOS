import UIKit

enum Action {
    case start, stop
    case open, close
    case block, unblock
    case off, cooling, fan, heating
    case empty, full
    case racingMode, normalMode

}

enum Brand: String {
    case chevrolet = "Chevrolet"
    case man = "MAN"
    case porsche = "Porsche"

}

class Car {
    let brand: Brand
    let model: String
    let color: String
    let year: Int
    var engineState: Action = .stop
    var windowState: Action = .close
    var doorState: Action = .unblock
    var airConState: Action = .off
    
    init(brand: Brand, model: String, color: String, year: Int) {
        self.brand = brand
        self.color = color
        self.model = model
        self.year = year
    }
    func changeSomeState(_ action: Action) {
    }
    // Вопрос по заданию, почему в 1 задании написано создать пустой метод действий, а в 5м написано мол нужно к ним применить различные действия, ведь я не смогу изменить действие этого класса, если метод оставлю пустым без перечислений, только вручную смогу делать в самом классе, например захочу открыть window или завести engine.
}

class TruckCar: Car {
    let maxTrunkVolume: Int
    var trunkState: Action = .empty
    
    init(brand: Brand, model: String, color: String, year: Int, maxTrunkVolume: Int) {
        self.maxTrunkVolume = maxTrunkVolume
        super.init(brand: brand, model: model, color: color, year: year)
    }
    override func changeSomeState(_ action: Action) {
        switch action {
        case .start, .stop:
            self.engineState = action
        case .open, .close:
            self.windowState = action
        case .block, .unblock:
            self.doorState = action
        case .off, .cooling, .fan, .heating:
            self.airConState = action
        case .empty, .full:
            self.trunkState = action
        default:
            print("У этой машины нету такой функции.")
        }
    }
}

class SportCar: Car {
    let time100kmph: Int
    let maxSpeed: Int
    var drivingMode: Action = .normalMode
    
    init(brand: Brand, model: String, color: String, year: Int, time100kmph: Int, maxSpeed: Int) {
        self.time100kmph = time100kmph
        self.maxSpeed = maxSpeed
        super.init(brand: brand, model: model, color: color, year: year)
    }
    override func changeSomeState(_ action: Action) {
        switch action {
        case .start, .stop:
            self.engineState = action
        case .open, .close:
            self.windowState = action
        case .block, .unblock:
            self.doorState = action
        case .off, .cooling, .fan, .heating:
            self.airConState = action
        case .racingMode, .normalMode:
            self.drivingMode = action
        default:
            print("У этой машины нету такой функции.")
        }
    }
}

let car = Car(brand: .chevrolet, model: "focus", color: "black", year: 2015)

let truckCar = TruckCar(brand: .man,model: "TGX", color: "white", year: 2010, maxTrunkVolume: 12_000)

let sportCar = SportCar(brand: .porsche, model: "911 GT3", color: "black", year: 2019, time100kmph: 4, maxSpeed: 360)

car.changeSomeState(.block)
print(car.doorState)

truckCar.changeSomeState(.full)
print(truckCar.trunkState)

sportCar.changeSomeState(.open)
print(sportCar.windowState)
