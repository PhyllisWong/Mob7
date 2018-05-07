//
//  Color.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/7/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    convenience init(_ hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

