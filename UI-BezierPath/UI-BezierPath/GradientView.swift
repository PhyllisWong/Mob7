//
//  Gradient.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/7/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import Foundation
import UIKit

typealias GradientType = (x: CGPoint, y: CGPoint)

import UIKit

class GradientView: UIView {
    
    let gradientLayer = CAGradientLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set the frame of the gradient layer to match the frame of the view
        gradientLayer.frame = frame
        layer.addSublayer(gradientLayer)
        
        gradientLayer.colors = [UIColor(red: 247/255.0, green: 107/255.0, blue: 28/255.0, alpha: 1.0).cgColor,
                                UIColor(red: 252/255.0, green: 217/255.0, blue: 97/255.0, alpha: 1.0).cgColor]
        
        // Angle, xPos, yPos, zPos
        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
    }
    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum GradientPoint {
        case leftRight
        case rightLeft
        case topBottom
        case bottomTop
        case topLeftBottomRight
        case bottomRightTopLeft
        case topRightBottomLeft
        case bottomLeftTopTopRight
        
        func draw() -> GradientType {
            switch self {
            case .leftRight:
                return (x: CGPoint(x: 0, y: 0.5), y: CGPoint(x: 1, y: 0.5))
            case .rightLeft:
                return (x: CGPoint(x: 1, y: 0.5), y: CGPoint(x: 0, y: 0.5))
            case .topBottom:
                return (x: CGPoint(x: 0.5, y:0), y: CGPoint(x: 0.5, y: 1))
            case .bottomTop:
                return (x: CGPoint(x: 0.5, y: 1), y: CGPoint(x: 0.5, y: 0))
            case .topLeftBottomRight:
                return (x: CGPoint(x: 0, y:0), y: CGPoint(x: 1, y: 1))
            case .bottomRightTopLeft:
                return (x: CGPoint(x: 1, y: 1), y: CGPoint(x: 0, y:0))
            case .topRightBottomLeft:
                return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 0, y:1))
            case .bottomLeftTopTopRight:
                return (x: CGPoint(x: 1, y: 0), y: CGPoint(x: 1, y:0))
            }
        }
    }
}







