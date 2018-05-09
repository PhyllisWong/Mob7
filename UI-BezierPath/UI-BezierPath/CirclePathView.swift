//
//  CirclePath.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/4/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class CirclePathView: UIView {

    lazy var circle: CAShapeLayer = {
        
        // Set the rectangle size to the bounds of the view
        let path = UIBezierPath(ovalIn: self.bounds)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 10
        shape.strokeColor = UIColor.red.cgColor
        return shape
    }()
    
    lazy var shadow: CALayer = {
        let layer = CALayer()
        
        layer.frame = CGRect(x: 75, y: 75, width: 150, height: 150)
        layer.backgroundColor = UIColor.darkGray.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        
        let contactShadowSize: CGFloat = 20
        let shadowPath = CGPath(ellipseIn: CGRect(x: -contactShadowSize,
                                                  y: -contactShadowSize * 0.5,
                                                  width: layer.bounds.width + contactShadowSize * 2,
                                                  height: contactShadowSize),
                                transform: nil)
        
        layer.shadowPath = shadowPath
        return layer
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(shadow)
//        layer.addSublayer(circle)

    }
    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
