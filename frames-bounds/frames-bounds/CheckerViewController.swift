//
//  CheckedViewController.swift
//  frames-bounds
//
//  Created by Phyllis Wong on 5/2/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class CheckerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // show black and grey checker board
        setupCheckerBoard()
    }

    func setupCheckerBoard() {
        let containerRect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        let containerView = UIView(frame: containerRect)
        self.view.addSubview(containerView)
        
        
        let subviewWidth = (self.view.frame.width) / CGFloat(8)
        //        var subviewsArray = [UIView]()
        var subX: CGFloat = 0
        var subY: CGFloat = 0
        var subRect = CGRect(x: subX, y: subX, width: subviewWidth, height: subviewWidth)
        
        // Start with the black square
        var isBlack = true
        
        // For each row along the top...
        for _ in 0...7 {
            // Create the columns down
            for _ in 0...7 {
                
                // This view will toggle between black and grey
                let subview = UIView(frame: subRect)
                
                if isBlack {
                    subview.backgroundColor = .black
                    isBlack = false // swap the color
                } else {
                    subview.backgroundColor = .gray
                    isBlack = true
                }
                containerView.addSubview(subview)
                
                // Move the piece down
                subY += subviewWidth
                subRect = CGRect(x: subX, y: subY, width: subviewWidth, height: subviewWidth)
            }
            
            // To get the next column to start with the color it was last
            isBlack = !isBlack
            
            // reset the y coordinate to the top
            subY = 0
            // move the piece to the right
            subX += subviewWidth
            subRect = CGRect(x: subX, y: subY, width: subviewWidth, height: subviewWidth)
        }
    }

}
