//
//  MyDayVC.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/19/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

class MyDayVC: UIViewController {

	@IBOutlet weak var progressCircle: BarView!
	@IBOutlet weak var calCountLabel: UILabel!
	@IBOutlet weak var textView: UITextView!
	
	var i = 1
	var circleAnimationTimer = NSTimer()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		progressCircle.circlePercent = 0
		progressCircle.setNeedsDisplay()
		circleAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "animateCircle", userInfo: nil, repeats: true)
		calCountLabel.text = String(History.caloriesBurnedToday)
		if History.caloriesBurnedToday < UserProfile.dailyCalorieGoal {
			textView.text = "Burn \(UserProfile.dailyCalorieGoal - History.caloriesBurnedToday) more to reach your daily goal"
		} else {
			textView.text = "Well done! You've reached your calorie goal for today!"
		}
		textView.textAlignment = .Center
		textView.textColor = UIColor.whiteColor()
    }
	
	func animateCircle() {
		progressCircle.circlePercent = CGFloat(i) / CGFloat(UserProfile.dailyCalorieGoal)
		progressCircle.setNeedsDisplay()
		i += 1
		if i > History.caloriesBurnedToday {
			circleAnimationTimer.invalidate()
		}
	}

}
