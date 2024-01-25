//
//  familyMembersViewController.swift
//  gameOfThrones2
//
//  Created by Makape Tema on 2023/03/06.
//

import UIKit

class familyMembersViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var familyMembersTable: UITableView!
    
//    var famInfo = [Character]()
    var char2: Character?
    var chars = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (char2?.family) != nil {
         //   chars = famInfo.filter { $0.family == family }
        }
        
        familyMembersTable.delegate = self
        familyMembersTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = chars[indexPath.row].fullName
        return cell
    }

    
    


}
