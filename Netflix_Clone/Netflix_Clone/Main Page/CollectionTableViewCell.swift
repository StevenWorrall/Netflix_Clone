//
//  mainTableViewCell.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 2/25/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

// with help from: https://johncodeos.com/how-to-add-uicollectionview-inside-uitableviewcell-using-swift/

import UIKit

protocol CollectionViewCellDelegate: class {
    func recreateAndAnimate(tableviewCell: CollectionTableViewCell, circularVideoCell: CircularVideoCell)
}

class CollectionTableViewCell: UITableViewCell {
    weak var cellDelegate: CollectionViewCellDelegate?
    var data: [CollectionViewCellModel]?
    var rowType: RowType?
    
    let previewCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let temp = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        temp.backgroundColor = .clear
        temp.showsHorizontalScrollIndicator = false
        return temp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        self.previewCollection.delegate = self
        self.previewCollection.dataSource = self
        
        self.previewCollection.register(CircularVideoCell.self, forCellWithReuseIdentifier: "previewCell")
        self.previewCollection.register(RectVideoCell.self, forCellWithReuseIdentifier: "plainCell")
        self.contentView.addSubview(self.previewCollection)
        self.previewCollection.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func updateCellWith(row: [CollectionViewCellModel], rowType: RowType) {
        self.rowType = rowType
        self.data = row
        self.previewCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch rowType {  
        case .circle:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCell", for: indexPath) as! CircularVideoCell
            cell.backgroundImage = self.data?[indexPath.row].image ?? UIImage.from(color: .gray)
            cell.backgroundImageView.image = cell.backgroundImage
            
            return cell
        case .square:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plainCell", for: indexPath) as! RectVideoCell
            cell.backgroundImage = self.data?[indexPath.row].image ?? UIImage.from(color: .gray)
            cell.backgroundImageView.image = cell.backgroundImage
            
            return cell
        case .featured:
            return UICollectionViewCell()
        case .none:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plainCell", for: indexPath) as! RectVideoCell
            cell.backgroundImage = self.data?[indexPath.row].image ?? UIImage.from(color: .gray)
            cell.backgroundImageView.image = cell.backgroundImage
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch rowType {
        case .circle:
            return CGSize(width: 110, height: 125)
        case .square:
            return CGSize(width: 110, height: 200)
        case .featured:
            return CGSize()
        case .none:
            return CGSize(width: 110, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch rowType {
        case .circle:
            let cell = collectionView.cellForItem(at: indexPath) as! CircularVideoCell
            self.cellDelegate?.recreateAndAnimate(tableviewCell: self, circularVideoCell: cell)
        case .square:
            return
        case .featured:
            return
        case .none:
            return
        }
        
    }
}
