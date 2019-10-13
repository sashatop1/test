import UIKit

class TableViewCell: UITableViewCell {
   
    static let identifier = "MainVCCell"
    
    @IBOutlet weak var waterAmountLabel: UILabel!
    
    func setupCell(withModel model: WaterAmount) {
        
        waterAmountLabel.text = String(model.waterAmount)
        
        }
    
    
}
