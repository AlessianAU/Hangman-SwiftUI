//
//  Stastistics.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import Foundation
import SwiftUI

class Statistics: ObservableObject {
	@Published var defaults = UserDefaults.standard
	
	@Published var color: Color = .accentColor
		
	///	Converts the color string saved in UserDefaults to a useable SwiftUI Color
	func hexToColor() {
		let selectedColor = defaults.string(forKey: "SelectedColor")
		if (selectedColor != "") {
			let rgbArray = selectedColor!.components (separatedBy: ",")
			if let red = Double(rgbArray[0]), let green = Double(rgbArray[1]), let blue = Double(rgbArray[2]) {
				color = Color(.sRGB, red: red, green: green, blue: blue)
			}
		} else {
			color = Color(0xFFB000)
		}
	}
	
	///	Increments UserDefaults item by amount
	func increment(key: String, amount: Int? = 1) {
		var num = defaults.integer(forKey: key)
		num += amount!
		defaults.set(num, forKey: key)
	}
	/// Subtracts UserDefaults item by amount
	func subtract(key: String, amount: Int? = 1) {
		var num = defaults.integer(forKey: key)
		num -= amount!
		defaults.set(num, forKey: key)
	}
	
	///	Subtracts and amount of money then adds same amount to money spent
	func purchase(amount: Int, hintAmount: Int? = 0) {
		if amount <= defaults.integer(forKey: "CurrentMoney") {
			
			var spent = defaults.integer(forKey: "MoneySpent")
			var current = defaults.integer(forKey: "CurrentMoney")
			current -= amount
			spent += amount
			defaults.set(current, forKey: "CurrentMoney")
			defaults.set(spent, forKey: "MoneySpent")
			
			if hintAmount != 0 {
				increment(key: "Hints", amount: hintAmount)
			}
		}
	}
	/// Calculates the win and loss streaks
	func streak(win: Bool) {
		if defaults.integer(forKey: win ? "CurrentWinStreak" : "CurrentLossStreak") == defaults.integer(forKey: win ? "LongestWinStreak" : "LongestLossStreak") {
			increment(key: win ? "LongestWinStreak" : "LongestLossStreak")
		}
		increment(key: win ? "CurrentWinStreak" : "CurrentLossStreak")
		defaults.set(0, forKey: win ? "CurrentLossStreak" : "CurrentWinStreak")
	}
	
	///	Detects preferred colour scheme
	func detectColorScheme() -> ColorScheme {
		let selectedAppearance = defaults.integer(forKey: "SelectedAppearance")
		var result: ColorScheme = .light
		
		if selectedAppearance == 2 {
			result = .dark
		} else if selectedAppearance == 1 {
			result = .light
		}
		return result
	}
	
	///	Converts UIColor to Hexidecimal to store in UserDefaults
	func uicolorToHex(color: Color) -> String {
		let uiColor = UIColor(color)
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		
		uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		
		return "\(red),\(green),\(blue),\(alpha)"
	}
}
