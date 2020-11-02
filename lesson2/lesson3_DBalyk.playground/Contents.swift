import UIKit

enum SportCar: String{
    case ford = "Ford"
    case chevrolet = "Chevrolet"
}

enum TruckCar: String {
    case kamaz = "КамАЗ"
    case man = "MAN"
}

enum EngineState {
    case start, stop
}

enum WindowState {
    case open, close
}

enum DoorState {
    case block, unblock
}

enum TrunkState {
    case empty, full
}

enum AirConditionerState {
    case off, cooling, fan, heating
}

struct PassengerCar {
    let brand: SportCar
    let model: String
    var color: String
    let year: UInt
    var engineState: EngineState = .stop
    var windowState: WindowState = .close
    var doorState: DoorState = .unblock
    private(set) var airCondState: AirConditionerState = .off
    private(set) var trunkState: TrunkState
    let maxTrunkVolume: UInt
    private(set) var currentTrunkVolume: UInt
    
    mutating func addCargo(volume: UInt) {
        if (currentTrunkVolume + volume <= maxTrunkVolume) {
            currentTrunkVolume += volume
            let freeVolume = maxTrunkVolume - currentTrunkVolume
            if freeVolume == 0 {
                trunkState = .full
                print("\(brand.rawValue) \(model) become full")
            } else {
                print("\(brand.rawValue) \(model) has free trunk space: \(freeVolume)")
            }
        } else {
            print("Cargo is too large for \(brand.rawValue) \(model)")
        }
        }
    
    
    mutating func removeCargo(volume: UInt) {
        if volume <= currentTrunkVolume {
            trunkState = .empty
            currentTrunkVolume -= volume
            let freeVolume = maxTrunkVolume - currentTrunkVolume
            if freeVolume == maxTrunkVolume {
                print("\(brand.rawValue) \(model) become empty")
            } else {
                print("\(brand.rawValue) \(model) has free trunk space: \(freeVolume)")
            }
        } else {
            print("\(brand.rawValue) \(model) has not so much cargo")
        }
    }

    mutating func changeAirCondState(newState: AirConditionerState) {
        if newState == .off {
            airCondState = .off
            print("In \(brand.rawValue) \(model) A/C is off")
        } else if airCondState == newState {
            print("In \(brand.rawValue) \(model) \(airCondState) is already on")
        } else {
            airCondState = newState
            print("In \(brand.rawValue) \(model) \(airCondState) is on")
        }
    }

    mutating func closeCar() {
        engineState = .stop
        windowState = .close
        changeAirCondState(newState: .off)
        doorState = .block
        print("\(brand.rawValue) \(model) is closed")
    }
}

struct Truck {
    let brand: TruckCar
    let model: String
    var color: String
    let year: UInt
    var engineState: EngineState = .stop
    var windowState: WindowState = .close
    var doorState: DoorState = .unblock
    private(set) var airCondState: AirConditionerState = .off
    private(set) var trunkState: TrunkState
    let maxTrunkVolume: UInt
    private(set) var currentTrunkVolume: UInt

    mutating func addCargo(volume: UInt) {
        if (currentTrunkVolume + volume <= maxTrunkVolume) {
            currentTrunkVolume += volume
            let freeVolume = maxTrunkVolume - currentTrunkVolume
            if freeVolume == 0 {
                trunkState = .full
                print("\(brand.rawValue) \(model) become full")
            } else {
                print("\(brand.rawValue) \(model) has free trunk space: \(freeVolume)")
            }
        } else {
            print("Cargo is too large for \(brand.rawValue) \(model)")
        }
    }

    mutating func removeCargo(volume: UInt) {
        if volume <= currentTrunkVolume {
            trunkState = .empty
            currentTrunkVolume -= volume
            let freeVolume = maxTrunkVolume - currentTrunkVolume
            if freeVolume == maxTrunkVolume {
                print("\(brand.rawValue) \(model) become empty")
            } else {
                print("\(brand.rawValue) \(model) has free trunk space: \(freeVolume)")
            }
        } else {
            print("\(brand.rawValue) \(model) has not so much cargo")
        }
    }

    mutating func closeCar() {
        engineState = .stop
        windowState = .close
        doorState = .block
        print("\(brand.rawValue) \(model) is closed")
    }
}


var truck = Truck(brand: .kamaz, model: "4308", color: "white", year: 2008, engineState: .stop, windowState: .close, trunkState: .empty, maxTrunkVolume: 10_000, currentTrunkVolume: 5_000)

var sportCar1 = PassengerCar(brand: .ford, model: "focus", color: "silver", year: 2016, engineState: .stop, windowState: .close, doorState: .block, airCondState: .off, trunkState: .empty, maxTrunkVolume: 1_500, currentTrunkVolume: 1_000)

var sportCar2 = PassengerCar(brand: .chevrolet, model: "Kamaro", color: "black", year: 2019, engineState: .stop, windowState: .close, doorState: .unblock, airCondState: .off, trunkState: .empty, maxTrunkVolume: 1_200, currentTrunkVolume: 1_000)

truck.windowState = .open
truck.engineState = .start
print(truck)
truck.addCargo(volume: 6_000)
truck.addCargo(volume: 5_000)
truck.removeCargo(volume: 9_000)
truck.removeCargo(volume: 100)
truck.closeCar()

sportCar1.doorState = .unblock
sportCar1.addCargo(volume: 100)
print(sportCar1.currentTrunkVolume)
sportCar1.removeCargo(volume: 1_100)
sportCar1.changeAirCondState(newState: .cooling)
sportCar1.changeAirCondState(newState: .heating)
sportCar1.closeCar()

sportCar2.windowState = .open
sportCar2.engineState = .start
sportCar2.addCargo(volume: 200)
sportCar2.removeCargo(volume: 500)
sportCar2.addCargo(volume: 600)
sportCar2.changeAirCondState(newState: .heating)
sportCar2.changeAirCondState(newState: .heating)
sportCar2.closeCar()
print(sportCar2.color)
