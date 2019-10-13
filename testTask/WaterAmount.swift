import Foundation
import RealmSwift

class WaterAmount: Object {
    
    @objc dynamic var waterAmount: Int = 0
  
    convenience init(waterAmount: Int) {
        self.init()
     
        self.waterAmount = waterAmount
        }
}

