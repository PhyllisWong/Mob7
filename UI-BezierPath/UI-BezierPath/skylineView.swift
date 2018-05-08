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
        skyGradient.zPosition = 0
        // Angle, xPos, yPos, zPos
        skyGradient.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1) // horizontal gradient, right to left
        return skyGradient
    }()
    
    lazy var circleLg: CAShapeLayer = {
        let shape = CAShapeLayer()
        let rect = CGRect(x: skyGradient.frame.width - 140, y: 30, width: 80, height: 80)
        let path = UIBezierPath(ovalIn: rect)
        shape.path = path.cgPath
        shape.lineWidth = 0
        shape.fillColor = lightYellow
        return shape
    }()
    
    lazy var circleSm: CAShapeLayer = {
        let shape = CAShapeLayer()
        let rect = CGRect(x: skyGradient.frame.width - 130, y: 40, width: 60, height: 60)
        let path = UIBezierPath(ovalIn: rect)
        shape.path = path.cgPath
        shape.lineWidth = 0
        shape.fillColor = darkYellow.cgColor
        return shape
    }()
    
    
    // Shape layers need a path, stroke color, line width
    lazy var sandLayer: CAShapeLayer = {
        let darksand = CAShapeLayer()
        let rect = CGRect(x: 0, y: skyGradient.bounds.height / 2, width: skyGradient.frame.width, height: skyGradient.bounds.height / 2.0)
        let path = UIBezierPath(rect: rect)
        darksand.path = path.cgPath
        darksand.fillColor = darkOrange
        darksand.lineWidth = 10
        darksand.zPosition = 1
        return darksand
    }()
    
    lazy var hillLayer: CAShapeLayer = {
        let lightsand = CAShapeLayer()
        let rect = CGRect(x: 0, y: (skyGradient.bounds.height / 2) - 20, width: skyGradient.frame.width, height: (skyGradient.bounds.height / 2.0) + 20)
        let path = UIBezierPath(rect: rect)
        lightsand.path = path.cgPath
        lightsand.fillColor = lightOrange
        lightsand.lineWidth = 10
        lightsand.zPosition = 1
        return lightsand
    }()
    
    lazy var darkOrange: CGColor = {
        let oc = UIColor(red: 255/255, green: 127/255, blue: 22/255, alpha: 1).cgColor
        return oc
    }()
    
    lazy var lightOrange: CGColor = {
        let oc = UIColor(red: 252/255, green: 170/255, blue: 103/255, alpha: 1).cgColor
        return oc
    }()
    
    lazy var darkYellow: UIColor = {
        let oc = UIColor(red: 247/255, green: 222/255, blue: 0/255, alpha: 1)
        return oc
    }()
    
    lazy var lightYellow: CGColor = {
        let lightYellow = darkYellow.withAlphaComponent(0.4).cgColor
        return lightYellow
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.addSublayer(skyGradient)
        layer.addSublayer(hillLayer)
        layer.addSublayer(sandLayer)
        layer.addSublayer(circleLg)
        layer.addSublayer(circleSm)
        layer.layoutSublayers()
    }

    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
