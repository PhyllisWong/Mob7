//
//  skylineView.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/7/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class SkylineView: UIView {

    lazy var skyGradient: CAGradientLayer = {
        let skyGradient = CAGradientLayer()
        // Set the frame of the gradient layer to match the frame of the view
        skyGradient.frame = frame
        
        let darkerBlue = UIColor(red: 112/255.0, green: 222/255.0, blue: 249/255.0, alpha: 1.0).cgColor
        let lighterBlue = UIColor(red: 209/255.0, green: 243/255.0, blue: 252/255.0, alpha: 1.0).cgColor
        skyGradient.colors = [darkerBlue, lighterBlue]
        
        // Angle, xPos, yPos, zPos
        skyGradient.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1) // horizontal gradient, right to left
        return skyGradient
    }()
    
    lazy var sandLayer: CAShapeLayer = {
        let ds = CAShapeLayer()
        var rect = CGRect(x: skyGradient.position.x, y: skyGradient.frame.height / 2.0, width: skyGradient.frame.width, height: skyGradient.frame.height /
        2.0)
        ds.zPosition = 1
        ds.frame = rect
        return ds
    }()
    
    lazy var darkOrange: CGColor = {
        let oc = UIColor(red: 255/255, green: 127/255, blue: 22/255, alpha: 1).cgColor
        return oc
    }()
    
    lazy var lightOrange: CGColor = {
        let oc = UIColor(red: 252/255, green: 170/255, blue: 103/255, alpha: 1).cgColor
        return oc
    }()
    
    lazy var darkYellow: CGColor = {
        let oc = UIColor(red: 255/255, green: 225/255, blue: 0/255, alpha: 1).cgColor
        return oc
    }()
    
    lazy var lightYellow: CGColor = {
        let oc = UIColor(red: 252/255, green: 239/255, blue: 143/255, alpha: 1).cgColor
        return oc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(skyGradient)
        layer.addSublayer(sandLayer)
    }

    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
