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
//        setupRedView()
        
        // show black and grey checker board
        setupCheckerBoard()
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
        let containerRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        let containerView = UIView(frame: containerRect)
        containerView.backgroundColor = .red
        self.view.addSubview(containerView)
        
        
        let subviewWidth = (self.view.frame.width) / CGFloat(8)
//        var subviewsArray = [UIView]()
        var subX: CGFloat = 0
        var subY: CGFloat = 0
        var subRect = CGRect(x: subX, y: subX, width: subviewWidth, height: subviewWidth)
        
        var isBlack = true
        // Create the rows
        for row in 0...7 {
            
            // Create the columns
            for box in 0...7 {
                let subview = UIView(frame: subRect)
                
                if isBlack {
                    subview.backgroundColor = .black
                    isBlack = false
                } else {
                    subview.backgroundColor = .gray
                    isBlack = true
                }
                containerView.addSubview(subview)
                
                // Move the piece down
                subY += subviewWidth
                subRect = CGRect(x: subX, y: subY, width: subviewWidth, height: subviewWidth)
                print(subY, subX)
            }
            
            isBlack = !isBlack
            
            // reset the y coordinate to the top
            subY = 0
            // move the piece to the right
            subX += subviewWidth
            subRect = CGRect(x: subX, y: subY, width: subviewWidth, height: subviewWidth)
        }
    }

}

