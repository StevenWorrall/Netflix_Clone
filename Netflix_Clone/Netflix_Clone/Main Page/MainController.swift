//
//  ViewController.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 9/24/19.
//  Copyright © 2019 StevenWorrall. All rights reserved.
//

import UIKit
import SnapKit

class MainController: UIViewController {
    private var data = Data()
    private let topNavBar = TopNavBarView()
    
    private var topNavBarConstraint: Constraint? = nil
    
    private let collectionTableReuseID = "collectionCellID"
    private let featureTableReuseID = "featureCellID"
    private let headerHeight: CGFloat = 40
    private let footerHeight: CGFloat = 16
    private let navViewHeight: CGFloat = 80
    private let circleCellHeight: CGFloat = 130
    private let rectCellHeight: CGFloat = 200
    private let featureCellHeight: CGFloat = 500
    private let sectionForFeature = 0
    private let numExtraSections = 1
    
    private var previousContentOffset: CGFloat = 0
    private var currentNavBarOffset: CGFloat = 0
    
    private let tableView: UITableView = {
        let temp = UITableView(frame: .zero, style: UITableView.Style.grouped)
        temp.backgroundColor = UIColor.clear
        temp.separatorStyle = .none
        temp.sectionHeaderHeight = 0.0
        temp.insetsContentViewsToSafeArea = false
        temp.contentInsetAdjustmentBehavior = .never
        temp.bounces = false
        return temp
    }()
    private var backgroundImage: UIImageView = {
        let temp = UIImageView()
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(named: "Background_Color")
        self.initalSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func initalSetup() {
        self.view.backgroundColor = .black
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: self.collectionTableReuseID)
        self.tableView.register(FeatureTableViewCell.self, forCellReuseIdentifier: self.featureTableReuseID)
        
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.view.addSubview(self.topNavBar)
        self.topNavBar.snp.makeConstraints { (make) in
            self.topNavBarConstraint = make.top.equalTo(self.view.snp.top).offset(self.currentNavBarOffset).constraint
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.height.equalTo(self.navViewHeight)
        }
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = data.objectsArray[indexPath.section].sectionType
        
        if sectionType == .featured {
            return self.featureCellHeight
        } else if sectionType == .circle {
            return self.circleCellHeight
        } else {
            return self.rectCellHeight
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != self.sectionForFeature {
            let headerView = SectionHeaderView()
            headerView.addLabelText(text: data.objectsArray[section - 1].category)
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == self.sectionForFeature {
            return 0
        }
        return self.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.footerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == self.sectionForFeature {
            if let cell = tableView.dequeueReusableCell(withIdentifier: self.featureTableReuseID, for: indexPath) as? FeatureTableViewCell {
                
                let sectionData = data.objectsArray[indexPath.section].videos[0]
                cell.backgroundImage.image = sectionData.image
                
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: self.collectionTableReuseID, for: indexPath) as? CollectionTableViewCell {
                let sectionData = data.objectsArray[indexPath.section]
                
                if sectionData.sectionType == .circle {
                    cell.updateCellWith(row: sectionData.videos, rowType: .circle)
                } else {
                    cell.updateCellWith(row: sectionData.videos, rowType: .square)
                }
                
                // Set cell's delegate
                cell.cellDelegate = self
                
                cell.selectionStyle = .none
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isBouncingTop { return }
        if scrollView.isBouncingBottom { return }
        
        let currentOffset = scrollView.contentOffset.y + scrollView.contentInset.top
        let offsetChange = self.previousContentOffset - currentOffset
        
        if currentOffset > self.previousContentOffset {
            if self.currentNavBarOffset + offsetChange < -self.navViewHeight {
                self.currentNavBarOffset = -self.navViewHeight
            } else {
                self.currentNavBarOffset += offsetChange
            }
        } else {
            if self.currentNavBarOffset + offsetChange > 0 {
                self.currentNavBarOffset = 0
            } else {
                self.currentNavBarOffset += offsetChange
            }
        }
        self.topNavBarConstraint?.update(offset: self.currentNavBarOffset)
        self.previousContentOffset = currentOffset
    }
}

extension MainController: CollectionViewCellDelegate {
    func recreateAndAnimate(tableviewCell: CollectionTableViewCell, circularVideoCell: CircularVideoCell) {
        let mainImgOverlay = setupOverlay(imageView: circularVideoCell.backgroundImageView, makeCircle: true, addBlur: true)
        let mainImageTransformation = getTransform(tableviewCell: tableviewCell, circularVideoCell: circularVideoCell, overlay: mainImgOverlay)
        
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut, animations: {
            mainImgOverlay.transform = mainImageTransformation
        }){ (completed: Bool) in
            let newVC = PreviewController(image: mainImgOverlay)
            newVC.modalPresentationStyle = .overCurrentContext
            newVC.isModalInPresentation = false
            self.present(newVC, animated: false, completion: nil)
            
        }
    }
    
    private func getTransform(tableviewCell: CollectionTableViewCell, circularVideoCell: CircularVideoCell, overlay: UIImageView) -> CGAffineTransform {
        //TODO clean up this code
        // safe area insets make centerpoint off due to top being larger than bottom
        let trueCenterY = self.view.center.y + self.view.safeAreaInsets.top - self.view.safeAreaInsets.bottom
        
        let mainImgX = self.view.center.x - circularVideoCell.center.x + tableviewCell.previewCollection.contentOffset.x
        let mainImgY = trueCenterY - circularVideoCell.center.y - (self.topNavBar.bounds.height + self.featureCellHeight) + self.tableView.contentOffset.y
        let mainImgTranslateNum: CGFloat = 9
        let mainImgOrgTransform = overlay.transform
        let mainImgScaledTransform = mainImgOrgTransform.translatedBy(x: mainImgX, y: mainImgY)
        
        //        let convertedFrame = circularVideoCell.logoView.convert(circularVideoCell.logoView.frame, to: self.view)
        //        print(convertedFrame)
        //        let logoImgOverlay = setupOverlay(imageView: circularVideoCell.logoView, makeCircle: false, addBlur: false)
        //        let logoImgX = 10 + convertedFrame.minX - tableviewCell.previewCollection.contentOffset.x
        //        let logoImgY = 90 - convertedFrame.maxY + self.view.safeAreaInsets.top + self.tableView.contentOffset.y
        //        let logoImgTranslateNum: CGFloat = 2
        //        let logoImgOrgTransform = logoImgOverlay.transform
        //        let logoImgScaledTransform = logoImgOrgTransform.translatedBy(x: logoImgX, y: logoImgY)
        //        let logoImgScaledAndTranslatedTransform = logoImgScaledTransform.scaledBy(x: logoImgTranslateNum, y: logoImgTranslateNum)
        
        return mainImgScaledTransform.scaledBy(x: mainImgTranslateNum, y: mainImgTranslateNum)
    }
    
    private func setupOverlay(imageView: UIImageView, makeCircle: Bool, addBlur: Bool) -> UIImageView {
        let overlay = UIImageView(image: imageView.image)
        overlay.contentMode = .scaleAspectFill
        if makeCircle {
            overlay.layer.cornerRadius = imageView.bounds.width / 2
        }
        overlay.layer.masksToBounds = true
        self.view.addSubview(overlay)
        
        overlay.snp.makeConstraints { (make) in
            make.edges.equalTo(imageView)
        }
        if addBlur {
            let tempBlur = CustomIntensityVisualEffectView(effect: UIBlurEffect(style: .regular), intensity: 0.05)
            tempBlur.frame = self.view.bounds
            overlay.addSubview(tempBlur)
        }
        return overlay
    }
    
    fileprivate func setupTransform() {
        
    }
}
