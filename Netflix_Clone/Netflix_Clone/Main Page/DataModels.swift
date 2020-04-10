//
//  CollectionViewCellModel.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 2/25/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import Foundation
import UIKit

struct CollectionViewCellModel {
    var image: UIImage
    var name: String
}

struct TableViewCellModel {
    var category: String
    var sectionType: RowType
    var videos: [CollectionViewCellModel]
}

enum RowType {
    case circle
    case square
}
