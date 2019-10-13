import UIKit
import RealmSwift


class WaterManager {
    
    private static let shared = WaterManager()
    private let realmInstance = try! Realm()
    private static let realm = shared.realmInstance
    
    static func allObjects() -> [WaterAmount] {
        return Array(realm.objects(WaterAmount.self))
    }
    
    static func addObject(object: WaterAmount) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    static func deleteObject(object: WaterAmount) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    static func arraySum(object: [WaterAmount]) -> Int {
        let array = object.map { Int($0.waterAmount) }
        let int = array.reduce(0) {$0 + $1}
        return int
    }
    
    
    
}
