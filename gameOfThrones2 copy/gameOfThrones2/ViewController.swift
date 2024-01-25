//
//  ViewController.swift
//  gameOfThrones2
//
//  Created by Makape Tema on 2023/02/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    @IBOutlet weak var tableView: UITableView!
    
     let searchControl = UISearchController()
    
    var charc = [Character]()
    lazy var filteredCharacters :[Character] = {
        return charc
    }()
    
   //@IBOutlet weak var heart: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Characters"
        searchControl.searchResultsUpdater = self
        navigationItem.searchController = searchControl
        
        downloadJSON {
            self.filteredCharacters = self.charc
            self.tableView.reloadData()
            print("success")
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        
            filteredCharacters = charc.filter(){
                $0.firstName?.capitalized.contains(text.capitalized) ?? false
            }
            
            if filteredCharacters.count == 0 {
                filteredCharacters = charc
            }
            tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "likeTableViewCell",for: indexPath) as? likeButtonTableViewCell else {
            return UITableViewCell()
        }
        let got = filteredCharacters[indexPath.row]
        cell.nameLabel.text = got.firstName!.capitalized
        cell.lastName.text = got.lastName!.capitalized
       
        //cell.likeImage = got.imageURL
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // set initial state
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 30, 0)
        cell.layer.transform = transform
        
        // animate to final state
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GOTManager {
            destination.got = filteredCharacters[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    @IBAction func tappedHeart(_ sender: UIButton) {
        
        
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://thronesapi.com/api/v2/Characters")
        
        URLSession.shared.dataTask(with: url!) { data, response, err in
            
            if err == nil {
                do {
                    self.charc = try JSONDecoder().decode([Character].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print("error fetching data from api")
                }
            }
        }.resume()
    }

}

