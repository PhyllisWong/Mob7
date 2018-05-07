//
//  CirclePath.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/4/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class CirclePathView: UIView {

    lazy var shapeLayer: CAShapeLayer = {
        
        // Set the rectangle size to the bounds of the view
        let path = UIBezierPath(ovalIn: self.bounds)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 10
        shape.strokeColor = UIColor.red.cgColor
        return shape
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(shapeLayer)

    }
    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
