//
//  ViewController.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/4/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    
    // Create a containter for the subviews
    lazy var containerView: UIView = {
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        let cv = UIView(frame: rect)
        cv.backgroundColor = .lightGray
        return cv
    }()

    lazy var gradientView: UIView = {
        let rect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        let gv = GradientView(frame: rect)
        return gv
    }()
    
    lazy var circleView: UIView = {
        let rect = CGRect(x: 20, y: 20, width: (self.view.frame.width) - 40, height: (self.view.frame.width) - 40)
        let cv = CirclePath(frame: rect)
        return cv
    }()
    
    
    // LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(containerView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.addSubview(circleView)
        containerView.addSubview(gradientView)
    }

}

