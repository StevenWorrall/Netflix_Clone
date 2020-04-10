//
//  Utilities.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 2/26/20.
//  Copyright © 2020 StevenWorrall. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

// https://stackoverflow.com/questions/25529500/how-to-set-the-blurradius-of-uiblureffectstyle-light/30744777
class CustomIntensityVisualEffectView: UIVisualEffectView {

    /// Create visual effect view with given effect and its intensity
    ///
    /// - Parameters:
    ///   - effect: visual effect, eg UIBlurEffect(style: .dark)
    ///   - intensity: custom intensity from 0.0 (no effect) to 1.0 (full effect) using linear scale
    init(effect: UIVisualEffect, intensity: CGFloat) {
        super.init(effect: nil)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in self.effect = effect }
        animator.fractionComplete = intensity
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: Private
    private var animator: UIViewPropertyAnimator!

}

// https://stackoverflow.com/questions/2853946/how-can-i-test-if-the-scroll-view-is-bouncing
extension UIScrollView {
  var isBouncing: Bool {
    return isBouncingTop || isBouncingLeft || isBouncingBottom || isBouncingRight
  }
  var isBouncingTop: Bool {
    return contentOffset.y < -contentInset.top
  }
  var isBouncingLeft: Bool {
    return contentOffset.x < -contentInset.left
  }
  var isBouncingBottom: Bool {
    let contentFillsScrollEdges = contentSize.height + contentInset.top + contentInset.bottom >= bounds.height
    return contentFillsScrollEdges && contentOffset.y > contentSize.height - bounds.height + contentInset.bottom
  }
  var isBouncingRight: Bool {
    let contentFillsScrollEdges = contentSize.width + contentInset.left + contentInset.right >= bounds.width
    return contentFillsScrollEdges && contentOffset.x > contentSize.width - bounds.width + contentInset.right
  }
}
