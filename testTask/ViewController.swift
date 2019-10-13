import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var goToTableView: UIButton!
    @IBOutlet weak var waterCount: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        waterCount?.text = String(WaterManager.arraySum(object: WaterManager.allObjects()))
    }

    let currentDate = Date()
    
    
    @IBAction func AddingWater(_ sender: Any) {
        guard let text = textField.text, let value = Int(text) else { return }
        
        let water = WaterAmount(waterAmount: value)
        WaterManager.addObject(object: water)
        waterCount.text = String(WaterManager.arraySum(object: WaterManager.allObjects()))
        textField.text?.removeAll()
        
    }
    
    @IBAction func DeleteWater(_ sender: Any) {
        guard let text = textField.text, let value = Int(text) else { return }
        let water = WaterAmount(waterAmount: value)
       
        
        
        if value > WaterManager.arraySum(object: WaterManager.allObjects()) {
            alert(title: "Wrong amount" , message: "Enter different amount of water", style: .alert)
            textField.text?.removeAll()
        } else {
        waterCount.text = String(WaterManager.arraySum(object: WaterManager.allObjects()) - value)
        WaterManager.deleteObject(object: water)
        textField.text?.removeAll()
        }
        
    }
    
    func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Okay", style: .default) { (action) in
            
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

}

