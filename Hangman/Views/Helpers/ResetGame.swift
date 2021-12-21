//
//  ResetGame.swift
//  Hangman
//
//  Created by Alessia on 20/12/2021.
//

import SwiftUI

struct ResetGame {
	@ObservedObject var appData = AppData()
	@ObservedObject var stats = Statistics()
	
//	func resetGame() {
//		appData.gameLetters = AppData.getLetters()
//		print("new game started")
//		appData.usedLetters.removeAll()
//		appData.correctLetters.removeAll()
//		appData.incorrectLetters.removeAll()
//		appData.lives = ["a","a","a","a","a","a","a","a"]
//		stats.lossed += 1
//	}
}
