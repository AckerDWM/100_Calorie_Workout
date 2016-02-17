//
//  SavingAndLoading.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 2/17/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import Foundation

struct SavingAndLoading {
	
	static func saveData() {
		
		// Save history
		NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: "lastWorkoutDate")
		NSUserDefaults.standardUserDefaults().setInteger(History.caloriesBurnedToday, forKey: "caloriesBurnedToday")
		
		// Save profile
		NSUserDefaults.standardUserDefaults().setInteger(UserProfile.dailyCalorieGoal, forKey: "dailyCalorieGoal")
		NSUserDefaults.standardUserDefaults().setDouble(UserProfile.weight, forKey: "weight")
		
	}
	
	static func loadData() {
		
		// Load saved user info
		History.caloriesBurnedToday = NSUserDefaults.standardUserDefaults().integerForKey("caloriesBurnedToday")
		History.lastWorkoutDate = NSUserDefaults.standardUserDefaults().objectForKey("lastWorkoutDate") as? NSDate
		
		// Load saved user profile info
		UserProfile.dailyCalorieGoal = NSUserDefaults.standardUserDefaults().integerForKey("dailyCalorieGoal")
		if UserProfile.dailyCalorieGoal == 0 {
			UserProfile.dailyCalorieGoal = 100
		}
		
		UserProfile.weight = NSUserDefaults.standardUserDefaults().doubleForKey("weight")
		if UserProfile.weight == 0.0 {
			UserProfile.weight = 150.0
		}
		
	}
	
}