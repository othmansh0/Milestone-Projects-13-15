//
//  DetailViewControllerTableViewController.swift
//  Milestone-Projects 13-15
//
//  Created by othman shahrouri on 9/16/21.
//

import UIKit

class DetailViewController: UITableViewController {
    var numRow = 0
    var detailCountries = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        
        
        switch numRow {
        case 0:
            cell.textLabel?.text = detailCountries[0].name
     
        case 1:
            cell.textLabel?.text = "\(detailCountries[0].currencies[0].name)"
        case 2:
            cell.textLabel?.text = "\(detailCountries[0].languages[0].nativeName)"
        case 3:
            cell.textLabel?.text = "\(detailCountries[0].nativeName)"
            
        default:
            break
        }
        numRow += 1
        return cell
    }
    
    
}
