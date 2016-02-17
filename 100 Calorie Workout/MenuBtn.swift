//
//  MenuBtn.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/18/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

@IBDesignable
class MenuBtn: UIButton {

    override func drawRect(rect: CGRect) {
        // Drawing code
		let height = self.bounds.height
		let width = self.bounds.width
		let barSize = CGSizeMake(width, height/6)
		UIColor.whiteColor().setFill()
		var path = UIBezierPath(rect: CGRect(origin: CGPointMake(0, 0), size: barSize))
		path.fill()
		path = UIBezierPath(rect: CGRect(origin: CGPointMake(0, height / 3), size: barSize))
		path.fill()
		path = UIBezierPath(rect: CGRect(origin: CGPointMake(0, (height / 3) * 2), size: barSize))
		path.fill()
    }

}
