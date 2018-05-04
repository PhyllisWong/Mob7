//
//  CirclePath.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/4/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class CirclePath: UIView {

    let shapeLayer = CAShapeLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(shapeLayer)
        
        // Set the rectangle size to the bounds of the view
        let path = UIBezierPath(ovalIn: self.bounds)
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.strokeColor = UIColor.red.cgColor
        
    }
    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
