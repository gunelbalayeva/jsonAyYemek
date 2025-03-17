//
//  CollectionTableViewCell+Exc.swift
//  14.03.practice
//
//  Created by User on 14.03.25.
//

import UIKit

extension UITableViewCell {
    
    static var identifier :String {
        String(describing: self)
    }
    
    static var nib :UINib {
        return UINib(nibName: self.identifier, bundle: .main)
    }
}

