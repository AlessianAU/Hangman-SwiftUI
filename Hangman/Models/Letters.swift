//
//  Letters.swift
//  Hangman
//
//  Created by Alessia on 15/12/2021.
//

import Foundation

class Letters: ObservableObject {
	@Published var usedLetters = [String]()
	@Published var gameLetters:Array = getLetters()
	@Published var correctLetters = [Character]()
	@Published var incorrectLetters = [Character]()
	
	static func getLetters() -> Array<Character> {
		let allWords = WordList.wordList
		let randomWord : String! = allWords.randomElement()
		let letters = Array(randomWord)
		print(letters)
		print(type(of: letters))
		return letters
	}
}
