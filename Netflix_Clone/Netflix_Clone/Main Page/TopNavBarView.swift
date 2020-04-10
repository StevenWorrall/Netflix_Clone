//
//  topNavBar.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 2/25/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import UIKit
import SnapKit

class TopNavBarView: UIView {
    private let fontSize = 14
    
    private var tvShowButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("TV Shows", for: .normal)
        temp.backgroundColor = UIColor.clear
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.titleLabel?.font = .systemFont(ofSize: 14)
        return temp
    }()
    private var movieButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("Movies", for: .normal)
        temp.backgroundColor = UIColor.clear
        temp.setTitleColor(UIColor.white, for: .normal)
        
        temp.titleLabel?.font = .systemFont(ofSize: 14)
        return temp
    }()
    private var myListButton: UIButton = {
        let temp = UIButton()
        temp.setTitle("My List", for: .normal)
        temp.backgroundColor = UIColor.clear
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.titleLabel?.font = .systemFont(ofSize: 14)
        return temp
    }()
    private var netflixLogoImageView: UIImageView = {
        let temp = UIImageView()
        let tempImage = UIImage(named: "netflix_logo")
        temp.image = tempImage
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    private var buttonStack: UIStackView = {
        let temp = UIStackView()
        temp.distribution = .equalCentering
        temp.alignment = .center
        temp.axis = .horizontal
        return temp
    }()
    private var backgroundBlur: UIVisualEffectView = {
        let tempEffect = UIBlurEffect(style: .dark)
        let temp = UIVisualEffectView(effect: tempEffect)
        temp.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return temp
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        self.backgroundBlur.frame = self.bounds
        self.addSubview(self.backgroundBlur)
        
        self.addSubview(self.netflixLogoImageView)
        self.netflixLogoImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp_centerYWithinMargins)
            make.leading.equalTo(self).offset(18)
            make.height.width.equalTo(16)
        }
        
        self.buttonStack.addArrangedSubview(self.tvShowButton)
        self.buttonStack.addArrangedSubview(self.movieButton)
        self.buttonStack.addArrangedSubview(self.myListButton)
        
        self.addSubview(self.buttonStack)
        self.buttonStack.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp_centerYWithinMargins)
            make.trailing.equalTo(self).offset(-34)
            make.leading.equalTo(self.netflixLogoImageView.snp.trailing).offset(44)
            make.height.equalTo(18)
        }
        
    }

}
