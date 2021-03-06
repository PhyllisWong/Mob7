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
        // horizontal gradient, right to left
        skyGradient.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        return skyGradient
    }()
    
    lazy var sunRays: CAShapeLayer = {
        let shape = CAShapeLayer()
        let rect = CGRect(x: skyGradient.frame.width - 140, y: 30, width: 80, height: 80)
        let path = UIBezierPath(ovalIn: rect)
        shape.path = path.cgPath
        shape.lineWidth = 0
        shape.fillColor = lightYellow
        return shape
    }()
    
    lazy var sun: CAShapeLayer = {
        let shape = CAShapeLayer()
        let rect = CGRect(x: skyGradient.frame.width - 130, y: 40, width: 60, height: 60)
        let path = UIBezierPath(ovalIn: rect)
        shape.path = path.cgPath
        shape.lineWidth = 0
        shape.fillColor = darkYellow.cgColor
        return shape
    }()
    
    
    // Shape layers need: a path & fillcolor or stroke color w/line width
    lazy var sandLayer: CAShapeLayer = {
        let darksand = CAShapeLayer()
        let rect = CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2.0)
        
        let bezier = UIBezierPath()
        
        // Set the anchor points
        let startPoint = CGPoint(x: 0, y: bounds.height / 2)
        let midPoint = CGPoint(x: bounds.midX, y: bounds.midY + 100)
        let endPoint = CGPoint(x: bounds.maxX, y: startPoint.y + 30)
        
        // Set the position of the control handle ends
        let controlPoint1 = CGPoint(x: midPoint.x / 2, y: startPoint.y)
        let controlPoint2 = CGPoint(x: controlPoint1.x, y: midPoint.y)
        let controlPoint3 = CGPoint(x: ((endPoint.x - midPoint.x) / 2) + midPoint.x, y: midPoint.y)
        let controlPoint4 = CGPoint(x: controlPoint3.x, y: endPoint.y)
        
        // Tell the pen to draw 2 connecting curves
        bezier.move(to: startPoint)
        bezier.addCurve(to: midPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        bezier.addCurve(to: endPoint, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        
        
        // Add closing lines for the rectangle
        let rightCorner = CGPoint(x: bounds.maxX, y: bounds.maxY)
        let leftCorner = CGPoint(x: bounds.minX, y: bounds.maxY)
        bezier.addLine(to: rightCorner)
        bezier.addLine(to: leftCorner)
        bezier.close()
        
        // Assign the path, set the color
        darksand.path = bezier.cgPath
        darksand.fillColor = sandColor
        darksand.zPosition = 1
        return darksand
    }()
    
    // Shape layers need a path, stroke color, line width
    lazy var hillLayer: CAShapeLayer = {
        let sand = CAShapeLayer()
        let rect = CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2.0)
        
        let bezier = UIBezierPath()
        
        // Set starting point
        let startPoint = CGPoint(x: 0, y: (bounds.height / 2) + 30)
        let midPoint = CGPoint(x: bounds.midX, y: bounds.midY + 80)
        let endPoint = CGPoint(x: bounds.maxX, y: bounds.height / 2)
        let controlPoint1 = CGPoint(x: midPoint.x / 2, y: startPoint.y)
        let controlPoint2 = CGPoint(x: controlPoint1.x, y: midPoint.y)
        let controlPoint3 = CGPoint(x: ((endPoint.x - midPoint.x) / 2) + midPoint.x, y: midPoint.y)
        let controlPoint4 = CGPoint(x: controlPoint3.x, y: endPoint.y)
        
        bezier.move(to: startPoint)
        bezier.addCurve(to: midPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        bezier.addCurve(to: endPoint, controlPoint1: controlPoint3, controlPoint2: controlPoint4)
        
        // Draw 2 connecting curves
        // Add closing lines
        let rightCorner = CGPoint(x: bounds.maxX, y: bounds.maxY)
        let leftCorner = CGPoint(x: bounds.minX, y: bounds.maxY)
        bezier.addLine(to: rightCorner)
        bezier.addLine(to: leftCorner)
        bezier.close()
        
        sand.path = bezier.cgPath
        sand.fillColor = lightSandColor
        //        darksand.strokeColor = darkOrange
        sand.lineWidth = 5
        sand.zPosition = 1
        return sand
    }()
    
    
    lazy var sandColor: CGColor = {
        let oc = UIColor(red: 255/255, green: 127/255, blue: 22/255, alpha: 1).cgColor
        return oc
    }()
    
    lazy var lightSandColor: CGColor = {
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
        layer.addSublayer(sunRays)
        layer.addSublayer(sun)
        layer.layoutSublayers()
    }

    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
