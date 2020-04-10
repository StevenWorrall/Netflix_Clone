//
//  PreviewCell.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 9/24/19.
//  Copyright © 2019 StevenWorrall. All rights reserved.
//

import UIKit
import SnapKit

class CircularVideoCell: UICollectionViewCell {
    var backgroundImage: UIImage = {
        let temp = UIImage()
        return temp
    }()
    var logoImage: UIImage = {
           let temp = UIImage()
           return temp
       }()
    var backgroundImageView: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.layer.masksToBounds = true
        return temp
    }()
    var logoView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "narcos_logo")
        imgView.backgroundColor = .clear
        imgView.contentMode = .scaleAspectFill
        return imgView
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
        self.backgroundImageView.layer.cornerRadius = self.bounds.width / 2
        self.contentView.addSubview(backgroundImageView)
        self.backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.centerX.equalTo(contentView)
            make.width.height.equalTo(contentView.bounds.width)
        }
        
        self.contentView.addSubview(logoView)
        logoView.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(contentView).offset(10)
            make.trailing.equalTo(contentView).offset(-10)
            make.height.equalTo(30)
        }
        
    }
}
