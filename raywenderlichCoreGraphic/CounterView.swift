//
//  CounterView.swift
//  raywenderlichCoreGraphic
//
//  Created by fathur rohman on 25/04/19.
//  Copyright © 2019 fathur rohman. All rights reserved.
//
import UIKit

@IBDesignable class CounterView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 8.0
        static let arcWidth: CGFloat = 150
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.blue
    @IBInspectable var counterColor2: UIColor = UIColor.yellow
    
    override func draw(_ rect: CGRect) {
        // 1
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // 3
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        // 4
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - Constants.arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // 5
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let startAngle2: CGFloat = .pi / 4
        let endAngle2: CGFloat = 3 * .pi / 4
        
        // 6
        let path2 = UIBezierPath(arcCenter: center,
                                radius: radius/2 - Constants.arcWidth/2,
                                startAngle: startAngle2,
                                endAngle: endAngle2,
                                clockwise: true)
        
        // 7
        path2.lineWidth = Constants.arcWidth
        counterColor2.setStroke()
        
        path2.stroke()
        
    }
}
