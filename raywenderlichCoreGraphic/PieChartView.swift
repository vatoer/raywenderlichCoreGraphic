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
    
    //must not bigger than width/2
    //@IBInspectable var arcWidth: CGFloat = 150
    
    //must not bigger than view width
    @IBInspectable var diameter: CGFloat = 300
    @IBInspectable var counter: Int = 5
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.blue
    @IBInspectable var counterColor2: UIColor = UIColor.yellow
    @IBInspectable var showLegend: Bool = true
    
    
    @IBInspectable var numberOfCategory: Int = 2
    @IBInspectable var categoriesData: [Float] = [1,5,3,4,1,3,1]
    @IBInspectable var categoriesLabel: [String] = ["Bottle", "Cup", "Bag", "Food Packaging", "Spoon or Fork", "Straw", "Cigarette Butt"]
    
    
    
    var counterColorRange: [UIColor] = [UIColor.blue, UIColor.red, UIColor.green , UIColor.yellow, UIColor.cyan, UIColor.darkGray, UIColor.orange, UIColor.black]
    
    
    
    
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth: CGFloat = 5.0
        //static let arcWidth: CGFloat = 150
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
        
        static let plusLineWidth: CGFloat = 17.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    func calculateCategoriesData()->Float{
        var sum: Float = 0
        for data in categoriesData{
            sum += data
        }
        return sum
    }
    
    override func draw(_ rect: CGRect) {
        
        //make sure diamater not out of bound
        let maxDiameter = min(diameter, bounds.width, bounds.height )
        
        let gapY = abs(bounds.height - diameter)
        let gapX = abs(bounds.width - diameter)
        print(gapY)
        
        
        if (diameter > maxDiameter){
            diameter = maxDiameter
        }
        //diameter = min(diameter, bounds.width, bounds.height )
        let radius = diameter/2
        
        
        let arcWidth: CGFloat = diameter/2
        
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
        //let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let center = CGPoint(x: (diameter + gapX ) / 2, y: (diameter) / 2 )
        
        // 2
        //let radius: CGFloat = max(bounds.width, bounds.height)
        
        //MARK: INIT ANGGLE
        var startAngle: CGFloat = 2 * .pi
        var endAngle: CGFloat = 2 * .pi
        var sumData: Float = 0
        var i: Int = 0
        for cdata in categoriesData{
            sumData += cdata
            endAngle = CGFloat(sumData * x / halfKeliling * .pi)
            let path = UIBezierPath(arcCenter: center,
                                    radius: radius - arcWidth/2,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)
            path.lineWidth = arcWidth
            counterColorRange[i].setStroke()
            path.stroke()
            
            startAngle = endAngle
            i += 1
        }
        
        
        //MARK : draw Rectangle For label
        //set up the width and height variables
        //for the horizontal stroke
        //let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        //let halfPlusWidth = plusWidth / 2
        
        //create the path
        let plusPath = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        plusPath.lineWidth = Constants.plusLineWidth
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(
            x: 150,
            y: 280 ))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(
            x: 200,
            y: 280))
        
        //set the stroke color
        UIColor.gray.setStroke()
        
        //draw the stroke
        //plusPath.stroke()
        
        print("startAngle", startAngle)
        print("endAngle", endAngle)
        
        
    }
}
