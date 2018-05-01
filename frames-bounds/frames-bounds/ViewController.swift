//
//  ViewController.swift
//  frames-bounds
//
//  Created by Phyllis Wong on 5/1/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var redView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the red view
        setupRedView()
    }
    
    func setupRedView() {
        let height = (self.view.frame.height - 40)
        let width = (self.view.frame.width - 40)
        let rectangle = CGRect(x: 20, y: 20, width: width, height: height)
        
        self.redView = UIView(frame: rectangle)
        self.redView.backgroundColor = .red
        
        // Add the subview to the view controller's view
        self.view.addSubview(redView)
    }
    
    func setupCheckerBoard() {
        
    }

}

