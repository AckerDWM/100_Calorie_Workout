//
//  UserProfileVC.swift
//  100 Calorie Workout
//
//  Created by Daniel Acker on 1/18/16.
//  Copyright © 2016 Daniel Acker. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var goalBtnOut: UIButton!
	@IBOutlet weak var weightBtnOut: UIButton!
	
	var buttonPressed = "goals"
	
	@IBAction func goalBtn(sender: AnyObject) {
		textField.hidden = false
		textField.becomeFirstResponder()
		buttonPressed = "goals"
	}
	
	@IBAction func weightBtn(sender: AnyObject) {
		textField.hidden = false
		textField.becomeFirstResponder()
		buttonPressed = "weight"
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		goalBtnOut.setTitle(String(UserProfile.dailyCalorieGoal), forState: .Normal)
		weightBtnOut.setTitle(String(Int(UserProfile.weight)), forState: .Normal)
		textField.hidden = true
    }

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		if buttonPressed == "goals" {
			UserProfile.dailyCalorieGoal = Int(textField.text ?? "100") ?? UserProfile.dailyCalorieGoal
			goalBtnOut.setTitle(String(UserProfile.dailyCalorieGoal), forState: .Normal)
		} else if buttonPressed == "weight" {
			UserProfile.weight = Double(textField.text ?? "150.0") ?? UserProfile.weight
			weightBtnOut.setTitle(String(Int(UserProfile.weight)), forState: .Normal)
		}
		textField.resignFirstResponder()
		textField.hidden = true
		return true
	}
	
}
