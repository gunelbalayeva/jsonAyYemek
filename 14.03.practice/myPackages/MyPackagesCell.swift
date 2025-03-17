//
//  MyPackagesCell.swift
//  14.03.practice
//
//  Created by User on 17.03.25.
//

import UIKit

class MyPackagesCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    struct MyItem :Codable{
    var title:String
    var subtitle:String
    var image:String
    }
    
    func configure(item:MyItem){
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        leftImageView.image = UIImage(named: item.image)
    }
    
    @IBAction func rigthButton(_ sender: Any) {

    }
    
}
