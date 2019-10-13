import UIKit

class TableViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var waterTable: UITableView!
    
    var arrayOfWater = WaterManager.allObjects()
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = waterTable.dequeueReusableCell(withIdentifier: "MainVCCell") as! TableViewCell
        let model = arrayOfWater[indexPath.section]
        cell.setupCell(withModel: model)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfWater.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            WaterManager.deleteObject(object: arrayOfWater[indexPath.section])
            arrayOfWater.remove(at: indexPath.section)
        tableView.reloadData()
        }
    }
    
    
}
