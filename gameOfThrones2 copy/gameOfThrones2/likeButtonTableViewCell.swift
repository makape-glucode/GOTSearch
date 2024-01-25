//
//  likeButtonTableViewCell.swift
//  gameOfThrones2
//
//  Created by Makape Tema on 2023/02/17.
//

import UIKit

class likeButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var likeImage: UIImageView!
    
    var got: Character?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        let imgUrl = "https://thronesapi.com/assets/images/" + (got?.image)!
//        print(imgUrl)
//        likeImage.downloaded(from: imgUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
