import Foundation
import UIKit

class ViewController : UIViewController {
    
    // resturant data
    let returant = ["MCDONALD'S", "STARBUCKS", "SUBWAY", "TACO BELL", "CHICK-FIL-A"]
    let data = [["Big Mac", "Spicy Crispy Chicken Sandwich", "Chicken McNuggets", "World Famous Fries", "Quarter Pounder®* with Cheese"],
                ["Hot Coffe", "Hot tea", "Hot Drink", "COld Coffee", "Ice Tea"],
                ["Subway Series", "Classic Sandwiches", "Freash melts", "Bready bowls", "Drinks"],
                ["Tacos", "Combos", "Burritos", "Specialties", "Sides"],
                ["Chicken Sandwich", "Spicy Chicken Sandwich", "Deluxe Sandwich"]]
    var menu = ["Nan", "Nan", "Nan", "Nan", "Nan"]
    
    // UITableView
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Grouped"
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}


// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Section:", indexPath.section, "Row:", indexPath.row )
        if (indexPath.section == 0) {
            menu = data[indexPath.row]
            tableView.reloadData()
        } else {
            print("Click Food:", menu[indexPath.row])
        }
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return returant.count
        } else {
            return menu.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = UIListContentConfiguration.cell()
        config.text = indexPath.section == 0 ? returant[indexPath.row] :  menu[indexPath.row]
        cell.contentConfiguration = config
        return cell
    }
}
