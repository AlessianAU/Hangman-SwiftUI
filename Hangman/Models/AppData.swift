//
//  Letters.swift
//  Hangman
//
//  Created by Alessia on 15/12/2021.
//

import Foundation

class AppData: ObservableObject {
	
	@Published var usedLetters = [String]()
	@Published var correctLetters = [Character]()
	@Published var incorrectLetters = [Character]()
	
	@Published var lives = ["a","a","a","a","a","a","a","a"]
	
	@Published var hapticFeedback : Bool = true
	
	@Published var debugActive : Bool = false
	@Published var debugViewActive : Bool = false
	
	@Published var showingSettings : Bool = false
	@Published var showingStatistics : Bool = false
	@Published var showingShop : Bool = false
	
	@Published var gameOver : Bool = false
	
	static func getLetters() -> Array<Character> {
		let allWords = WordList.aquaticAnimals
		let randomWord : String! = allWords.randomElement()
		let letters = Array(randomWord)
		print(letters)
		return letters
	}
}

class GameData: ObservableObject, Identifiable {
	@Published var id = UUID()
	@Published var gameLetters:Array = AppData.getLetters()
}
