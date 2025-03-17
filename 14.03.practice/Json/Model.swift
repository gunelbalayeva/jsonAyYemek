//
//  Model.swift
//  14.03.practice
//
//  Created by User on 17.03.25.
//

import UIKit
import Foundation

struct Model:Codable {
    var packages:[PackageTableViewCell.PackageItem]
    var economs:[EconomTableViewCell.EconomItem]
    var model :[MyPackagesCell.MyItem]
    
}

