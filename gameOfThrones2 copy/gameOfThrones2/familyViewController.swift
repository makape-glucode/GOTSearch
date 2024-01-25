//
//  familyViewController.swift
//  gameOfThrones2
//
//  Created by Makape Tema on 2023/03/06.
//

import UIKit

class familyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var familyTable: UITableView!
    
        var famInfo = [Character]()
        var uniqueFamilies = [String]()
        
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            title = "Family Names"
            
            downloadJSON {
                self.uniqueFamilies = self.getUniqueFamilies()
                self.familyTable.reloadData()
                print("success")
            }
            
            familyTable.delegate = self
            familyTable.dataSource = self
        }
        
        func getUniqueFamilies() -> [String] {
            var uniqueFamilies = [String]()
            for char in famInfo {
                if let family = char.family {
                    if !uniqueFamilies.contains(family) {
                        uniqueFamilies.append(family)
                    }
                }
            }
            return uniqueFamilies.sorted()
        }
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return uniqueFamilies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = uniqueFamilies[indexPath.row]
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetails2", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? familyMembersViewController {
                let family = uniqueFamilies[familyTable.indexPathForSelectedRow!.row]
                let chars = famInfo.filter { $0.family == family }
                destination.chars = chars
            }
        }
        
        func downloadJSON(completed: @escaping () -> ()) {
            let url = URL(string: "https://thronesapi.com/api/v2/Characters?family")
            
            URLSession.shared.dataTask(with: url!) {data, response, error in
                
                if error == nil {
                    do {
                        self.famInfo = try JSONDecoder().decode([Character].self, from: data!)
                    }
                    catch {
                        print("error fetching data from API")
                    }
                    
                    DispatchQueue.main.async{
                        completed()
                    }
                }
            }.resume()
        }
    }
