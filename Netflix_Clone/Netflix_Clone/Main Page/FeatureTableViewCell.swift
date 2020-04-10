//
//  FeatureTableViewCell.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 3/24/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
