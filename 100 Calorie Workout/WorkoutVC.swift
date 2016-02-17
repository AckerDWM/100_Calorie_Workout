//
//  WorkoutVC.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/16/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

class WorkoutVC: UIViewController {
	
	@IBOutlet weak var currentExerciseLabel: UILabel!
	@IBOutlet weak var timerLabel: UILabel!
	@IBOutlet weak var nextExerciseLabel: UILabel!
	@IBOutlet weak var progressLabel: UILabel!

	var exerciseTimer = NSTimer()
	var restTimer = NSTimer()
	var timeRemaining = 30
	var exerciseIdx = 0
	
	@IBAction func endBtn(sender: AnyObject) {
		exerciseTimer.invalidate()
		restTimer.invalidate()		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		CurrentWorkout.exercisesRemaining = CurrentWorkout.numberOfExerciseCycles
		exerciseTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateExerciseTime", userInfo: nil, repeats: true)
		currentExerciseLabel.text = CurrentWorkout.allExercises[CurrentWorkout.currentExercisesIdxs[exerciseIdx]]
		nextExerciseLabel.text = CurrentWorkout.allExercises[CurrentWorkout.currentExercisesIdxs[(exerciseIdx + 1) % 4]]
		progressLabel.text = "\(CurrentWorkout.numberOfExerciseCycles - CurrentWorkout.exercisesRemaining) / \(CurrentWorkout.numberOfExerciseCycles)"
    }

	func updateExerciseTime() {
		timeRemaining -= 1
		timerLabel.text = String(timeRemaining)
		if timeRemaining == 0 {
			exerciseTimer.invalidate()
			CurrentWorkout.exercisesRemaining -= 1
			if CurrentWorkout.exercisesRemaining > 0 {
				timeRemaining = 10
				restTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateRestTime", userInfo: nil, repeats: true)
				currentExerciseLabel.text = "Rest"
				progressLabel.text = "\(CurrentWorkout.numberOfExerciseCycles - CurrentWorkout.exercisesRemaining) / \(CurrentWorkout.numberOfExerciseCycles)"
			} else {
				// show completion VC
				self.performSegueWithIdentifier("workoutOver", sender: self)
			}
		}
	}
	
	func updateRestTime() {
		timeRemaining -= 1
		timerLabel.text = String(timeRemaining)
		if timeRemaining == 0 {
			restTimer.invalidate()
			exerciseIdx = (exerciseIdx + 1) % 4 // loop exercises
			currentExerciseLabel.text = CurrentWorkout.allExercises[CurrentWorkout.currentExercisesIdxs[exerciseIdx]]
			nextExerciseLabel.text = CurrentWorkout.allExercises[CurrentWorkout.currentExercisesIdxs[(exerciseIdx + 1) % 4]]
			timeRemaining = 30
			exerciseTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateExerciseTime", userInfo: nil, repeats: true)
		}
	}
	
	// MARK: prevent device from sleeping during workout
	override func viewDidAppear(animated: Bool) {
		UIApplication.sharedApplication().idleTimerDisabled = true
	}
	
	override func viewDidDisappear(animated: Bool) {
		UIApplication.sharedApplication().idleTimerDisabled = false
	}
	
}
