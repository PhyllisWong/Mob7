//
//  PatternViewController.swift
//  frames-bounds
//
//  Created by Phyllis Wong on 5/2/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class PatternViewController: UIViewController {
    
    // Get the initial width and height
    lazy var width: CGFloat = 0.0
    lazy var height: CGFloat = 0.0
    lazy var xPos: CGFloat = 0.0
    lazy var yPos: CGFloat = 0.0
    
    
    lazy var containerView: UIView = {
        self.width = self.view.frame.width
        self.height = self.view.frame.height
        
        self.xPos = 0
        self.yPos = 0
        
        let rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        let vc = UIView(frame: rect)
        return vc
    }()
    
    func createBlackViews() {
        // Get width and height of views
        let width = (self.width / 2) - 30
        
        // Get coordinates of each view
        // Margin 20px
        var xPos = containerView.bounds.origin.x + 20
        var yPos = containerView.bounds.origin.y + 20
        
        var rect = CGRect(x: xPos, y: yPos, width: width, height: width)
        
        // 6 square views: 2 columns side by side
        // Create the row of 2
        for _ in 0...1 {
            
            // Create the columns of 3
            for _ in 0...2 {
                // This view will have a black background
                let subview = UIView(frame: rect)
                subview.layer.cornerRadius = 10
                subview.backgroundColor = .black
 
                containerView.addSubview(subview)
                
                // Move the piece down
                yPos += (width + 20)
                rect = CGRect(x: xPos, y: yPos, width: width, height: width)
            }
            xPos += width + 20
            yPos = containerView.bounds.origin.y + 20
            rect = CGRect(x: xPos, y: yPos, width: width, height: width)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let pattern = UIImage(named: "pattern")
        let patternImageView = UIImageView(image: pattern)
        containerView.addSubview(patternImageView)
        createBlackViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(containerView)
    }
}
