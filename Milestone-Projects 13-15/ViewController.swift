//
//  ViewController.swift
//  Milestone-Projects 13-15
//
//  Created by othman shahrouri on 9/15/21.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    var countries = [Country]()
    
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
                flags.append(item.replacingOccurrences(of: ".png", with: ""))
             
                
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        countries.removeAll()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let urlString = createUrl(name: flags[indexPath.row].lowercased())
       if let url = URL(string: urlString) {
           if let data = try? Data(contentsOf: url) {
               parse(json: data)
            
            if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
              
                vc.numRow = 0
                if !countries.isEmpty {
                
                    vc.detailCountries = countries
                    navigationController?.pushViewController(vc, animated: true)
                
                }
                else {
                    let ac = UIAlertController(title: "Unavailable", message: "\(flags[indexPath.row]) is currently unavailable", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    present(ac,animated: true)
                    return
                }
                
                
                
            }
               //parse json
           }
          
       }
        
     
        
        
    }
    
    
    func parse(json: Data){
        //dedicated to converting between JSON and Codable objects.
        let decoder = JSONDecoder()
        
        // asking it to convert our json data into a Petitions object,Petitions.self to refer to the type itself rather than an instance
        if let jsonCountries = try? decoder.decode([Country].self, from: json){
            
            countries = jsonCountries
            print(countries)
        }
      
        
    }
    
    func createUrl(name:String) -> String{
        return "https://restcountries.eu/rest/v2/name/\(name)?fullText=true"
    }
    
}

