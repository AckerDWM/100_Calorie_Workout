//
//  workoutOverVC.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/17/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit
import Social

class WorkoutOverVC: UIViewController {

	@IBOutlet weak var caloriesBurnedLabel: UILabel!
	@IBOutlet weak var caloriesBurnedTodayLabel: UILabel!
	
	var alertController = UIAlertController(
		title: "Well done!",
		message: "You've reached your calorie goal for today!",
		preferredStyle: .Alert
	)
	
	// Handle request for app rating (problems here)
	@IBAction func rateMeBtn(sender: AnyObject) {
		
		UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=<963626507>")!)
		// not right ID
		
	}
	
	// Handle posting to facebook
	@IBAction func fbBtn(sender: AnyObject) {
		
		if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
			let fbVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
			fbVC.setInitialText("I burned \(History.caloriesBurnedToday) calories today with '100 Calorie Workout'!")
			self.presentViewController(fbVC, animated: true, completion: nil)
		}
		
	}
	
	// Handle posting to twitter
	@IBAction func twitterBtn(sender: AnyObject) {
		
		if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
			let tweetVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
			tweetVC.setInitialText("I burned \(History.caloriesBurnedToday) calories today! #100CalorieWorkout")
			self.presentViewController(tweetVC, animated: true, completion: nil)
		}
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		// Hide extra labels if the screen is small
		let height = self.view.bounds.height
		if height <= 480.0 {
			caloriesBurnedTodayLabel.hidden = true
		}
		
		// Update record calories burned today
		let percentComplete = Double(CurrentWorkout.numberOfExerciseCycles - CurrentWorkout.exercisesRemaining) / Double(CurrentWorkout.numberOfExerciseCycles)
		let caloriesBurned = Int(0.0175 * UserProfile.weightInKg * 14.5 * (Double(CurrentWorkout.numberOfExerciseCycles) / 2.0) * percentComplete)
		History.caloriesBurnedToday += caloriesBurned
		
		// Display calories burned during workout
		caloriesBurnedLabel.text = String(caloriesBurned)
		
		// Display calories burned today
		caloriesBurnedTodayLabel.text = "You burned \(History.caloriesBurnedToday) calories today!" // too long for iphone screens
		
		// Congratulate the user if they achieved their daily goal
		if History.caloriesBurnedToday >= UserProfile.dailyCalorieGoal {
			alertController.message = "You've achieved your calorie goal for today!"
			self.presentViewController(alertController, animated: true, completion: nil)
		}
		
    }

}
