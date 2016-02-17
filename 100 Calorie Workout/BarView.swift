//
//  BarView.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/19/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

@IBDesignable
class BarView: UIView {

	var circlePercent: CGFloat = 1.333
	let pi = CGFloat(M_PI)
	
    override func drawRect(rect: CGRect) {
        // Drawing code
		
		let width = self.bounds.width
		
		let baseCirclePath = UIBezierPath()
		baseCirclePath.addArcWithCenter(CGPointMake(self.bounds.midX, self.bounds.midY), radius: width/2 - 10, startAngle: 0, endAngle: 2.0 * pi, clockwise: true)
		if circlePercent < 1 {
			UIColor.lightGrayColor().setStroke()
		} else {
			UIColor(red: 0, green: 0.5, blue: 0.1, alpha: 1).setStroke()
		}
		baseCirclePath.lineWidth = 20
		baseCirclePath.stroke()
		
		let circlePath = UIBezierPath()
		circlePath.addArcWithCenter(CGPointMake(self.bounds.midX, self.bounds.midY), radius: width/2 - 10, startAngle: pi * 1.5, endAngle: circlePercent * 2.0 * pi - 0.5 * pi, clockwise: true)
		
		let circleColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.8)
		circleColor.setStroke()
		circlePath.lineWidth = 20
		circlePath.lineCapStyle = .Round
		circlePath.stroke()
    }

}
