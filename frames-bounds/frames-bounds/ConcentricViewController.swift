//
//  ConcentricViewController.swift
//  frames-bounds
//
//  Created by Phyllis Wong on 5/2/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class ConcentricViewController: UIViewController {
    
    // Set the correct red color
    let red = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 1)
    
    // Get the initial width and height
    lazy var width: CGFloat = 0.0
    lazy var height: CGFloat = 0.0
    lazy var xPos: CGFloat = 0.0
    lazy var yPos: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupContainerView()
        setupInnerViews()
    }
    
    lazy var containerView: UIView = {
        // Get the initial width and height
        self.width = (self.view.frame.width) - 20
        self.height = (self.view.frame.height) - 20
        self.xPos += 10
        self.yPos += 10

        // Set the rectangle in position, and give it an initial size
        let rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        let vc = UIView(frame: rect)
        vc.backgroundColor = .red
        
        return vc
    }()
    
    func setupContainerView() {
       
        self.view.addSubview(containerView)
    }
    
    // Create 7 views that are 40px smaller on each side then the last one
    // Place them 20px to the left, and 20px down from the last one
    // reduce the saturation by 10% from the last one
    
    func setupInnerViews() {
        var width = self.width - 40
        var height = self.height - 40
        var xPos = self.xPos + 10
        var yPos = self.yPos + 10
        
        var rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        var sat: CGFloat = 1.0 - 0.1
        
        for _ in 0...6 {
            let subview = UIView(frame: rect)
            subview.layer.cornerRadius = 10
            subview.backgroundColor = UIColor(hue: 1, saturation: sat, brightness: 1, alpha: 1)
            containerView.addSubview(subview)
            
            // Shrink and move the piece down
            xPos += 20
            yPos += 20
            width -= 40
            height -= 40
            rect = CGRect(x: xPos, y: yPos, width: width, height: height)
            sat -= 0.1
        }
    }
}






