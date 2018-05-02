//
//  WhiteViewController.swift
//  frames-bounds
//
//  Created by Phyllis Wong on 5/2/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class RainbowViewController: UIViewController {
    
    // Keep track of colors with an enum and index
    var currentBGColor = 0
    var colorsArray = [Colors.redOrange, .orange, .yellow, .lightGreen, .green, .greenBlue, .lightBlue, .blue, .violet, .pink, .redPink, .red]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(containerView)
        setupRainbowView()
        
    }

    lazy var containerView: UIView = {
        let width = (self.view.frame.width) - 40
        let height = self.view.frame.height - 40
        
        var xPos = CGFloat(20)
        var yPos = CGFloat(20)
        
        let rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        let vc = UIView(frame: rect)
        vc.backgroundColor = .red
        
        return vc
    }()
    
    // Create a rainbow view with 12 colors
    // width same as the screen width with a 20px margin
    // height of the 12 color stack screen height with 20 px margin
    func setupRainbowView() {
        let width = (containerView.frame.width)
        let height = (containerView.frame.height) / CGFloat(12)
        let xPos: CGFloat = 0
        var yPos: CGFloat = 0
        var rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        
        // Create the column down
        for _ in 0...11 {
            let subview = UIView(frame: rect)
            subview.backgroundColor = nextColor()
            
            containerView.addSubview(subview)
            
            // Move the piece down
            yPos += height
            rect = CGRect(x: xPos, y: yPos, width: width, height: height)
        }
        
    }
    
    func nextColor() -> UIColor {
        // Get the next color on the wheel
        currentBGColor = currentBGColor % colorsArray.count
        if currentBGColor < 11 {
            currentBGColor += 1
        }
        
        return colorsArray[currentBGColor].toUIColor()
    }
}

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
                return UIColor(r: 255, g: 51, b: 51)
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






