//
//  CounterView.swift
//  raywenderlichCoreGraphic
//
//  Created by fathur rohman on 25/04/19.
//  Copyright © 2019 fathur rohman. All rights reserved.
//
import UIKit

@IBDesignable
class PieChartView: UIView {
    // MARK : @IBInspectable
    @IBInspectable var arcWidth: CGFloat = 10
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.blue
    @IBInspectable var counterColor2: UIColor = UIColor.yellow
    
    
    @IBInspectable var numberOfCategory: Int = 2
    @IBInspectable var categoriesData: [Float] = [1,5,3,20]
    
    var counterColorRange: [UIColor] = [UIColor.blue, UIColor.red, UIColor.green , UIColor.yellow]
    
    
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 150
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    func calculateCategoriesData()->Float{
        var sum: Float = 0
        for data in categoriesData{
            sum += data
        }
        return sum
    }
    
    override func draw(_ rect: CGRect) {
        // 1
        print("diameter", bounds.width )
        print("keliling", bounds.width * .pi )
        
        //keliling dari lingkaran
        let keliling = Float(bounds.width * .pi)
        let halfKeliling = keliling / 2
        
        //nilai total dari nilai
        let total: Float = calculateCategoriesData()
        let x = keliling / total
        print(x)
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        //MARK: INIT ANGGLE
        var startAngle: CGFloat = 2 * .pi
        var endAngle: CGFloat = 2 * .pi
        var sumData: Float = 0
        var i: Int = 0
        for cdata in categoriesData{
            sumData += cdata
            endAngle = CGFloat(sumData * x / halfKeliling * .pi)
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius/2 - arcWidth/2,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            path.lineWidth = arcWidth
            counterColorRange[i].setStroke()
            path.stroke()
            
            startAngle = endAngle
            i += 1
        }
        
        print("startAngle", startAngle)
        print("endAngle", endAngle)
        
        
    }
}
