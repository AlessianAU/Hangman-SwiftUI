//
//  Stastistics.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import Foundation

class Statistics: ObservableObject {
	@Published var defaults = UserDefaults.standard
	
//	Increments UserDefaults item by 1
	func increment(key: String) {
		var num = defaults.integer(forKey: key)
		num += 1
		defaults.set(num, forKey: key)
	}
	
//	Subtracts and amount of money then adds same amount to money spent
	func purchase(amount: Int) {
		if amount <= defaults.integer(forKey: "CurrentMoney") {
			
			var spent = defaults.integer(forKey: "MoneySpent")
			var current = defaults.integer(forKey: "CurrentMoney")
			current -= amount
			spent += amount
			defaults.set(current, forKey: "CurrentMoney")
			defaults.set(spent, forKey: "MoneySpent")
			
		}
	}
}
