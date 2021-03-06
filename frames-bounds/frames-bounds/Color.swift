//
//  Color.swift
//  frames-bounds
//
//  Created by Phyllis Wong on 5/2/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit


enum Colors {
    
    // Colors to present the rainbow stack
    case redOrange
    case orange
    case yellow
    case lightGreen
    case green
    case greenBlue
    case lightBlue
    case blue
    case violet
    case pink
    case redPink
    case red
    
    func toUIColor() -> UIColor {
        
        switch self {
            case .redOrange:
                return UIColor(r: 255, g: 51, b: 0)
            case .orange:
                return UIColor(r: 255, g: 145, b: 0)
            case .yellow:
                return UIColor(r: 255, g: 255, b: 0)
            case .lightGreen:
                return UIColor(r: 128, g: 255, b: 0)
            case .green:
                return UIColor(r: 0, g: 255, b: 0)
            case .greenBlue:
                return UIColor(r: 0, g: 255, b: 128)
            case .lightBlue:
                return UIColor(r: 0, g: 255, b: 255)
            case .blue:
                return UIColor(r: 0, g: 0, b: 255)
            case .violet:
                return UIColor(r: 128, g: 0, b: 255)
            case .pink:
                return UIColor(r: 255, g: 0, b: 255)
            case .redPink:
                return UIColor(r: 255, g: 0, b: 128)
            case .red:
                return UIColor(r: 255, g: 0, b: 0)
        }
    }
}


extension UIColor {
    
    // Extension on colors to make RGB easier to read
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
