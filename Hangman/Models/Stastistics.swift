//
//  Stastistics.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import Foundation

class Statistics: ObservableObject {
	@Published var defaults = UserDefaults.standard
	
	func increment(key: String) {
		var num = defaults.integer(forKey: key)
		num += 1
		defaults.set(num, forKey: key)
	}
}
