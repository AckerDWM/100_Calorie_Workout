//
//  History.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 2/17/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import Foundation

struct History {
	
	static var caloriesBurnedToday = 0
	static var lastWorkoutDate: NSDate?
	static var workoutHistoryDates: [NSDate] = []
	static var workoutHistoryCalories: [Int] = []
	
	static func todayIsLastWorkoutDate(lastWorkoutDate: NSDate) -> Bool {
		
		let today = NSCalendar.currentCalendar().components(.Day, fromDate: NSDate())
		let lastWorkoutDay = NSCalendar.currentCalendar().components(.Day, fromDate: lastWorkoutDate)
		
		if today != lastWorkoutDay {
			return false
		}
		
		return true
		
	}
	
	static func updatedHistory() {
		
		if let lastWorkoutDateUnwrapped = History.lastWorkoutDate {
			
			if History.todayIsLastWorkoutDate(lastWorkoutDateUnwrapped) == false {
				
				History.workoutHistoryDates.append(lastWorkoutDateUnwrapped)
				History.workoutHistoryCalories.append(History.caloriesBurnedToday)
				
				History.lastWorkoutDate = NSDate()
				History.caloriesBurnedToday = 0
				
			}
			
		} else if History.lastWorkoutDate == nil {
			History.lastWorkoutDate = NSDate()
		}
		
	}
	
}


