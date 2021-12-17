//
//  Letters.swift
//  Hangman
//
//  Created by Alessia on 15/12/2021.
//

import Foundation

class AppData: ObservableObject {
	@Published var usedLetters = [String]()
	@Published var gameLetters:Array = getLetters()
	@Published var correctLetters = [Character]()
	@Published var incorrectLetters = [Character]()
	
	@Published var hapticFeedback : Bool = true
	@Published var debugActive : Bool = false
	
	@Published var showingSettings : Bool = false
	@Published var showingStatistics : Bool = false
	
	static func getLetters() -> Array<Character> {
		let allWords = WordList.wordList
		let randomWord : String! = allWords.randomElement()
		let letters = Array(randomWord)
		print(letters)
		return letters
	}
}
