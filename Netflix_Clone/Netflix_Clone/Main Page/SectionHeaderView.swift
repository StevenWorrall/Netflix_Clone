//
//  SectionHeaderView.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 3/24/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
    private let titleLabel: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.white
        temp.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
        self.backgroundColor = UIColor.clear
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func addLabelText(text: String) {
        titleLabel.text = text
    }
}
