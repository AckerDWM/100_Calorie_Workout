//
//  ViewController.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/16/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
	
	@IBOutlet weak var exerciseLabel_1: UILabel!
	@IBOutlet weak var exerciseLabel_2: UILabel!
	@IBOutlet weak var exerciseLabel_3: UILabel!
	@IBOutlet weak var exerciseLabel_4: UILabel!
	
	@IBOutlet weak var boxHeight_1: NSLayoutConstraint!
	@IBOutlet weak var boxHeight_2: NSLayoutConstraint!
	@IBOutlet weak var boxHeight_3: NSLayoutConstraint!
	@IBOutlet weak var boxHeight_4: NSLayoutConstraint!
	
	var canShuffleExercises = true
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		updateExerciseLabels(CurrentWorkout.currentExercisesIdxs)
		setBoxHeights()
	}
	
	// MARK: Prevent shuffling while not on main VC
	override func viewDidAppear(animated: Bool) {
		canShuffleExercises = true
	}
	
	override func viewDidDisappear(animated: Bool) {
		canShuffleExercises = false
	}
	
	// MARK: Shuffle exercises on shake motion
	override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
		if motion == .MotionShake && canShuffleExercises {
			CurrentWorkout.currentExercisesIdxs = CurrentWorkout.shuffleExercises()
			updateExerciseLabels(CurrentWorkout.currentExercisesIdxs)
		}
	}
	
	// MARK: Configure the view
	func setBoxHeights() {
		let screenHeight = self.view.bounds.height
		let boxHeight = (screenHeight - 320) / 4
		boxHeight_1.constant = boxHeight
		boxHeight_2.constant = boxHeight
		boxHeight_3.constant = boxHeight
		boxHeight_4.constant = boxHeight
	}
	
	func updateExerciseLabels(exerciseIdxs: [Int]) {
		exerciseLabel_1.text = CurrentWorkout.allExercises[exerciseIdxs[0]]
		exerciseLabel_2.text = CurrentWorkout.allExercises[exerciseIdxs[1]]
		exerciseLabel_3.text = CurrentWorkout.allExercises[exerciseIdxs[2]]
		exerciseLabel_4.text = CurrentWorkout.allExercises[exerciseIdxs[3]]
	}
	
}

