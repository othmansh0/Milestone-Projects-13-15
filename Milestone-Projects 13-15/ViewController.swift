//
//  ViewController.swift
//  Milestone-Projects 13-15
//
//  Created by othman shahrouri on 9/15/21.
//

import UIKit

class ViewController: UITableViewController {
    var countries = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries"
        
        let fm = FileManager.default
        guard let path = Bundle.main.resourcePath else {return}
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.contains("png"){
                //removes png from each country
                //let cs = CharacterSet.init(charactersIn: ".png")
                countries.append(item)
                
            }
        }
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cs = CharacterSet.init(charactersIn: ".png")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].trimmingCharacters(in: cs)
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

