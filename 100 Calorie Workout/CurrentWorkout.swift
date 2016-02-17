//
//  CurrentWorkout.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/16/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import Foundation

struct CurrentWorkout {
	
	static let allExercises = [
		"Sit-ups",
		"Pistol Squats",
		"Jump Squats",
		"Push-ups",
		"Mountain Climbers",
		"Jumping Jacks",
		"High Knees",
		"Skater's Lunges",
		"Burpees",
		"Lunges",
		"Run in Place",
		"Bicycle Crunches",
		"Calf Raises",
		"Leg Raises"
	]
	
	static var exercisesRemaining = Int()
	
	static var numberOfExerciseCycles: Int {
		get {
			return Int(ceil((100.0 * 2.0) / (0.0175 * UserProfile.weightInKg * 14.5)))
		}
	}
	
	static var currentExercisesIdxs = CurrentWorkout.shuffleExercises()
	
	static func shuffleExercises() -> [Int] {
		var currentExercisesIdxs = [9999, 9999, 9999, 9999]
		for i in 0...3 {
			var uniqueIdx = false
			while !uniqueIdx {
				let newIdx = Int(arc4random_uniform(UInt32(CurrentWorkout.allExercises.count)))
				if currentExercisesIdxs.indexOf(newIdx) == nil {
					currentExercisesIdxs[i] = newIdx
					uniqueIdx = true
				}
			}
		}
		return currentExercisesIdxs
	}
	
}