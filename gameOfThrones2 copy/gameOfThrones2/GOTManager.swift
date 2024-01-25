//
//  GOTManager.swift
//  gameOfThrones2
//
//  Created by Makape Tema on 2023/02/17.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class GOTManager: UIViewController, UICollectionViewDelegate {
    
  
    
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charLastName: UILabel!
    @IBOutlet weak var charFullName: UILabel!
    @IBOutlet weak var charFamily: UILabel!
    @IBOutlet weak var charTitle: UILabel!
    
    @IBOutlet weak var charImage: UIImageView!
    
    
    
    
        
  
    
    var got: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        charName.text = got?.firstName
        charLastName.text = got?.lastName
        charFullName.text = got?.fullName
        charFamily.text = got?.family
        charTitle.text = got?.title
        
        let imgUrl = "https://thronesapi.com/assets/images/" + (got?.image)!
        print(imgUrl)
        charImage.downloaded(from: imgUrl)
        
      
    }

}
