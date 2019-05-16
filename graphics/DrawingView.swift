//
//  DrawingView.swift
//  graphics
//
//  Created by student on 16/05/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

enum Shape{
    case circle
    case rectangle
}
class DrawingView: UIView {

    var currentShape: Shape?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
            print("Draw code just clicked")
    
        guard let currentContext = UIGraphicsGetCurrentContext() else{
            print("Could not get context")
            return
        }
        drawRectangle(user:currentContext, isFilled: false)
    }
    func drawShape(selectedShape:Shape){
     currentShape = selectedShape
        setNeedsDisplay()
    }
    
    func toFill(isFilled:Bool) -> Bool{
        var aux = isFilled
        if aux{
            aux = false
        }else{
            aux = true
        }
        return aux
    }
    private func drawRectangle(user context: CGContext, isFilled: Bool){
        var isFilled = isFilled
        let strokeDistance: CGFloat = 25
        let centerPoint = CGPoint(x: bounds.size.width/2, y : bounds.size.height/2)
        let lowerLeftCorner = CGPoint(x:centerPoint.x-strokeDistance, y:centerPoint.y+strokeDistance)
        
        let lowerRightCorner = CGPoint(x:centerPoint.x+strokeDistance, y:centerPoint.y+strokeDistance)
        let upperLeftCorner = CGPoint(x:centerPoint.x-strokeDistance, y:centerPoint.y-strokeDistance*2)
        let upperRightCorner = CGPoint(x:centerPoint.x+strokeDistance, y:centerPoint.y-strokeDistance*2)
        
        context.move(to: lowerLeftCorner)
        context.addLine(to: lowerLeftCorner)
        context.addLine(to: lowerRightCorner)
        context.addLine(to: upperRightCorner)
        context.addLine(to: upperLeftCorner)
        context.addLine(to: lowerLeftCorner)
        
        context.setLineCap(.square)
        context.setLineWidth(8.0)
        //isFilled = toFill(isFilled: isFilled)
        if isFilled{
            context.setFillColor(UIColor.purple.cgColor)
            context.fillPath()
        }else{
            context.setStrokeColor(UIColor.red.cgColor)
            context.strokePath()
        }
        
    }

}
