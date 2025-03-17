//
//  PackageTableViewCell.swift
//  14.03.practice
//
//  Created by User on 14.03.25.
//

import UIKit
protocol Delegate :AnyObject {
    func didTapButton(item:PackageTableViewCell.PackageItem)
}

class PackageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var centerImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var kecidButton: UIButton!
    
   weak var delegate:Delegate?
    
 struct PackageItem :Codable{
            var header :String
            var image :String
            var title:String
            var subtitle:String
        }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
   
    func configure(item:PackageItem ){
        headerLabel.text = item.header
        centerImage.image = UIImage(named: item.image)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        
    }
    @IBAction func addButton(_ sender: UIButton) {
        print("SALAMM")
        let item = PackageItem(
                header: headerLabel.text ?? "",
                image: centerImage.image?.accessibilityIdentifier ?? "",
                title: titleLabel.text ?? "",
                subtitle: subtitleLabel.text ?? ""
                
            )
            delegate?.didTapButton(item: item)
    }
}
