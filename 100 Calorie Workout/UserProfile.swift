//
//  UserProfile.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/18/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import Foundation

struct UserProfile {
	
	static var weight = 150.0 // kg (convert from pounds)
	
	static var weightInKg: Double { get { return UserProfile.weight * 0.453592 } }
	
	static var dailyCalorieGoal = 100
	
	static var caloriesBurnedToday = 0 {
		didSet(oldVal) {
			if UserProfile.calorieHistory[UserProfile.calorieHistory.count-1].date == NSDate() {
				UserProfile.calorieHistory[UserProfile.calorieHistory.count-1].calories = caloriesBurnedToday
			} else {
				UserProfile.caloriesBurnedToday = UserProfile.caloriesBurnedToday - oldVal
				let newTuple: (date: NSDate, calories: Int) = (date: NSDate(), calories: UserProfile.caloriesBurnedToday)
				UserProfile.calorieHistory.append(newTuple)
			}
		}
	}
	
	static var calorieHistory: [(date: NSDate, calories: Int)] = [(date: NSDate(timeIntervalSince1970: 0), calories: 0)]

}