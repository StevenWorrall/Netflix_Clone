//
//  PlainVideoCell.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 2/26/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import UIKit

class RectVideoCell: UICollectionViewCell {
    private var cellPadding: CGFloat = 20
    
    var backgroundImage: UIImage = {
        let temp = UIImage()
        return temp
    }()
    var backgroundImageView: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.layer.masksToBounds = true
        return temp
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        setupView()
    }
       
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundImageView.layer.cornerRadius = 4
        self.contentView.addSubview(backgroundImageView)
        self.backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
}
