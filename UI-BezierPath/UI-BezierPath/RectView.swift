//
//  RectViewController.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/7/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class RectView: UIView {
    
    // Set the correct red color
    let red = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 1)
    
    // Get the initial width and height
    lazy var width: CGFloat = 0.0
    lazy var height: CGFloat = 0.0
    lazy var xPos: CGFloat = 0.0
    lazy var yPos: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupContainerLayer()
        self.setupLayers()
    }
    
    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var containerView: UIView = {
        // Get the initial width and height
        self.width = (layer.bounds.width)
        self.height = (layer.bounds.height)
        
        // Set the rectangle in position, and give it an initial size
        let rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        let vc = UIView(frame: rect)
        vc.backgroundColor = .red
        
        return vc
    }()
    
    func setupContainerLayer() {
        
        self.addSubview(containerView)
    }
    
    // Create 7 views that are 40px smaller on each side then the last one
    // Place them 20px to the left, and 20px down from the last one
    // reduce the saturation by 10% from the last one
    
    func setupLayers() {
        var width = containerView.frame.width
        var height = containerView.frame.height
        var xPos = self.xPos
        var yPos = self.yPos
        
        var rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        var hue: CGFloat = 1.0
        var sat: CGFloat = 1.0 - 0.1
        
        for _ in 0...6 {
            let layer = CALayer()
            layer.frame = rect

//            layer.frame = rectFrame
            
            layer.cornerRadius = 10
            layer.backgroundColor = UIColor(hue: hue, saturation: sat, brightness: 1, alpha: 1).cgColor
            containerView.layer.addSublayer(layer)
            
            // Shrink and move the piece down
            xPos += 15
            yPos += 15
            width -= 30
            height -= 30
            rect = CGRect(x: xPos, y: yPos, width: width, height: height)
            hue -= 0.05
            sat -= 0.15
        }
    }
}
