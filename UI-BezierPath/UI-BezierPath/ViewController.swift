//
//  ViewController.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/4/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 20, y: 40, width: self.view.frame.width - 40, height: self.view.frame.width - 40)
        let bezierView = CirclePath(frame: rect)
        
        view.addSubview(bezierView)
    }
}

