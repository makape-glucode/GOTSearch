//
//  favoritesViewController.swift
//  gameOfThrones2
//
//  Created by Makape Tema on 2023/02/17.
//

import UIKit

class favoritesViewController: UIViewController {
    
    @IBOutlet weak var favorite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        favorite.text = "Displaying your favorite characters"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
