//
//  ChartView.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/23/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

@IBDesignable
class ChartView: UIView {

	var Y = [100, 80, 70, 145, 160, 155, 170]
	var goal = UserProfile.dailyCalorieGoal
	
    override func drawRect(rect: CGRect) {
        // Drawing code
		var points = [CGPoint](count: Y.count, repeatedValue: CGPoint())
		if Y.count > 1 {
			for i in 0...Y.count-1 {
				let y = Y[i]
				let newPoint = CGPointMake((CGFloat(i) / CGFloat(Y.count))*self.bounds.width, self.bounds.height-(CGFloat(y) / CGFloat(Y.maxElement()!))*self.bounds.height)
				points[i] = newPoint
			}
			let path = UIBezierPath()
			path.moveToPoint(points[0])
			for i in 1...points.count-1 {
				path.addLineToPoint(points[i])
			}
			path.addLineToPoint(CGPointMake(points[points.count-1].x, self.bounds.height))
			path.addLineToPoint(CGPointMake(0, self.bounds.height))
			UIColor.whiteColor().setFill()
			path.fill()
		}
		let goalPath = UIBezierPath()
		let goalY = self.bounds.height-(CGFloat(goal) / CGFloat(Y.maxElement()!))*self.bounds.height
		goalPath.moveToPoint(CGPointMake(0, goalY))
		goalPath.addLineToPoint(CGPointMake(self.bounds.width, goalY))
		goalPath.setLineDash([10.0, 5.0], count: 2, phase: 0)
		goalPath.lineWidth = 10
		self.superview?.backgroundColor?.setStroke()
		goalPath.stroke()
    }

}
