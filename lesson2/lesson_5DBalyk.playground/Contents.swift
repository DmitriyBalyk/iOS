import UIKit

enum Action {
    case start, stop
    case open, close
    case block, unblock
    case off, on
    case empty, full
    case racingMode, normalMode
    
}
enum Brand: String {
    case man = "MAN"
    case porsche = "Porsche"
    
}
protocol Car {
    var brand: Brand { get }
    var color: String { get }
    var model: String { get }
    var year: Int { get }
    var engineState: Action { get set }
    var windowState: Action { get set }
    var doorState: Action { get set }
    var mp3State: Action { get set }
    
    mutating func changeEngineState(_ action: Action)
    mutating func changeWindowState(_ action: Action)
    mutating func changeDoorState(_ action: Action)
    mutating func changeMp3State(_ action: Action)
}

extension Car {
    mutating func changeEngineState(_ action: Action){
        self.engineState = action
    }
    mutating func changeWindowState(_ action: Action){
        self.windowState = action
    }
    mutating func changeDoorState(_ action: Action){
        self.doorState = action
    }
    mutating func changeMp3State(_ action: Action){
        self.mp3State = action
    }
}

class SportCar: Car {
    var brand: Brand
    var color: String
    var model: String
    var year: Int
    var engineState: Action = .stop
    var windowState: Action = .close
    var doorState: Action = .unblock
    var mp3State: Action = .off
    
    let time100kmph: Int
    let maxSpeed: Int
    var drivingMode: Action = .normalMode
    
    init(brand: Brand, color: String, model: String, year: Int, time100kmph: Int, maxSpeed: Int){
        self.brand = brand
        self.color = color
        self.model = model
        self.year = year
        self.time100kmph = time100kmph
        self.maxSpeed = maxSpeed
    }
}

class TruckCar: Car {
    var brand: Brand
    var color: String
    var model: String
    var year: Int
    var engineState: Action = .start
    var windowState: Action = .close
    var doorState: Action = .block
    var mp3State: Action = .on
    
    let maxTrunkVolume: Int
    var currentTrunkVolume: Int = 0
    var trunkState: Action = .empty
    
    init(brand: Brand, color: String, model: String, year: Int, maxTrunkVolume: Int){
        self.brand = brand
        self.color = color
        self.model = model
        self.year = year
        self.maxTrunkVolume = maxTrunkVolume
    }
    
    func addCargo(volume: Int) {
        func evaluateAndLoad() {
            currentTrunkVolume += volume
            (maxTrunkVolume - currentTrunkVolume == 0) ? fullState() : print("\(brand.rawValue) \(model) имеет немного груза: \(maxTrunkVolume) -  \(currentTrunkVolume)")
        }
        func fullState(){
            trunkState = .full
            print("\(brand.rawValue) \(model) стал полным")
        }
        func tooLargeForTrunk(){
            print("Груз велик для \(brand.rawValue) \(model)")
        }
        (currentTrunkVolume + volume <= currentTrunkVolume) ? evaluateAndLoad() : tooLargeForTrunk()
    }
    
    func removeCargo(volume: Int) {
        if (volume <= currentTrunkVolume) {
            trunkState = .empty
            currentTrunkVolume -= volume
            let freeVolume = maxTrunkVolume - currentTrunkVolume
            if freeVolume == maxTrunkVolume {
                print("\(brand.rawValue) \(model) стал пустой")
            } else {
                print("\(brand.rawValue) \(model) есть свободное место в багажнике: \(freeVolume)")
            }
        } else {
            print("\(brand.rawValue) \(model) имеет немного груза")
        }
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return " Спортивный автомобиль: \(brand.rawValue) \(model) \n Цвет: \(color) \n Максимальная скорость: \(maxSpeed) \n Ускорение от 0–100 km/h за \(time100kmph) cекунды\n"
    }
}

var sportCar = SportCar(brand: .porsche, color: "white", model: "911 GT3", year: 2017, time100kmph: 3, maxSpeed: 300)
var truckCar = TruckCar(brand: .man, color: "black", model: "TGX", year: 2019, maxTrunkVolume: 150000)

truckCar.removeCargo(volume: 1000)
truckCar.changeEngineState(.start)
print(truckCar)

sportCar.changeWindowState(.open)
sportCar.changeEngineState(.start)
sportCar.drivingMode = .racingMode
print(sportCar)
