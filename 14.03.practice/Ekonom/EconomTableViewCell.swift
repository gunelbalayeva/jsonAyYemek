//
//  EconomTableViewCell.swift
//  14.03.practice
//
//  Created by User on 17.03.25.
//

import UIKit

class EconomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
   
    
    struct EconomItem: Codable{
        var leftImage:String
        var title:String
        var subtitle:String
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
    }
    func configure(item:EconomItem){
        leftImageView.image = UIImage(named: item.leftImage)
        titleLabel.text = item.title
        subTitleLabel.text = item.subtitle
    }
}
