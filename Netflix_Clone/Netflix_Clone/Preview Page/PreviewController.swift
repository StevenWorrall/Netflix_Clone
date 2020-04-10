//
//  PreviewController.swift
//  Netflix_Clone
//
//  Created by Steven Worrall on 9/24/19.
//  Copyright © 2019 StevenWorrall. All rights reserved.
//

import UIKit
import SnapKit

class PreviewController: UIViewController {
    var initialTouchPoint = CGPoint.zero
    
    var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    init(image: UIImageView) {
        self.backgroundImage = image
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        self.view.alpha = 0
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerHandler(_:)))
        view.addGestureRecognizer(gestureRecognizer)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 1
        }, completion: { _ in
            self.backgroundImage.removeFromSuperview()
        })
    }
    
    
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        //TODO fix this getting stuck / gping too far up
        
        let touchPoint = sender.location(in: view?.window)
        let screenHeight = self.view.frame.height
        
        switch sender.state {
        case .began:
            self.initialTouchPoint = touchPoint
        case .changed:
            if view.frame.origin.y >= 0 {
                view.frame.origin.y = touchPoint.y - self.initialTouchPoint.y
            } 
            
        case .ended, .cancelled:
            if touchPoint.y  > screenHeight * 0.5  { // have to pull the page down over 50%
                dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.frame = CGRect(x: 0,
                                             y: 0,
                                             width: self.view.frame.size.width,
                                             height: self.view.frame.size.height)
                })
            }
        case .failed, .possible:
            break
        @unknown default:
            break
        }
    }
}
