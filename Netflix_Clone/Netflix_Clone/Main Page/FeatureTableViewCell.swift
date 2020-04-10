//
//  FeatureTableViewCell.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 3/24/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import UIKit

class FeatureTableViewCell: UITableViewCell {
    var backgroundImage: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        temp.layer.masksToBounds = true
        return temp
    }()
    let gradientLayer: CAGradientLayer = {
        let temp = CAGradientLayer()
        temp.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        temp.startPoint = CGPoint(x: 0.5, y: 0.0)
        temp.endPoint = CGPoint(x: 0.5, y: 1.0)
        temp.locations = [0, 1]
        return temp
    }()
    let gradientView: UIView = {
        let temp = UIView()
        return temp
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(backgroundImage)
        self.backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        

        self.contentView.addSubview(self.gradientView)
        self.gradientView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.height.equalTo(100)
        }
        self.layoutIfNeeded()
        
        gradientLayer.frame = self.gradientView.bounds
        self.gradientView.layer.addSublayer(gradientLayer)
        print(self.gradientView.bounds)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
