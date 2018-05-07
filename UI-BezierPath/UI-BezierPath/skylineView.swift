//
//  skylineView.swift
//  UI-BezierPath
//
//  Created by Phyllis Wong on 5/7/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class skylineView: UIView {

    let skyLayer: CAShapeLayer = {
        let sky = CAShapeLayer()
        return sky
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(skyLayer)
        
        
    }
    
    // For initializing from storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
