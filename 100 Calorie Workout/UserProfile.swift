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
	
	static var weightInKg: Double {
		
		get {
			return UserProfile.weight * 0.453592
		}
		
	}
	
	static var dailyCalorieGoal = 100

}