//
//  TrackProgressVC.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/23/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

class TrackProgressVC: UIViewController {

	@IBOutlet weak var maxLabel: UILabel!
	@IBOutlet weak var minLabel: UILabel!
	@IBOutlet weak var chart: ChartView!
	@IBOutlet weak var dateLabelLeft: UILabel!
	@IBOutlet weak var dateLabelRight: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let calories = History.workoutHistoryCalories
		let dates = History.workoutHistoryDates
		
		if calories.count > 1 {
			chart.Y = calories
		} else {
			chart.Y = [0, 0]
		}
		chart.setNeedsDisplay()
		
		maxLabel.text = String(calories.maxElement() ?? 100)
		minLabel.text = String(calories.minElement() ?? 0)
		
		dateLabelLeft.text = dateString(dates.first ?? NSDate())
		dateLabelRight.text = dateString(dates.last ?? NSDate())
    }
	
	func dateString(date: NSDate) -> String {
		let df = NSDateFormatter()
		df.dateFormat = "dd"
		let day = df.stringFromDate(date)
		df.dateFormat = "MM"
		let month = df.stringFromDate(date)
		df.dateFormat = "yy"
		let year = df.stringFromDate(date)
		return "\(month)/\(day)/\(year)"
	}

}
