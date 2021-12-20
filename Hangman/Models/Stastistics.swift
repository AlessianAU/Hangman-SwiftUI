//
//  Stastistics.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import Foundation

class Statistics: ObservableObject {
	@Published var played: Int = 0
	@Published var won: Int = 0
	@Published var lossed: Int = 0
	@Published var pressed: Int = 0
	@Published var longestWinStreak: Int = 0
	@Published var totalTime: Int = 0
	@Published var averageTime: Int = 0
	@Published var currentWinStreak: Int = 0
	@Published var longestLossStreak: Int = 0
	@Published var currentLossStreak: Int = 0
}
