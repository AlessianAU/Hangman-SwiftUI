//
//  Letters.swift
//  Hangman
//
//  Created by Alessia on 15/12/2021.
//

import Foundation
import Alamofire

class AppData: ObservableObject {
	
	@Published var gameLetters:Array = AppData.getLetters()
	@Published var usedLetters = [String]()
	@Published var correctLetters = [Character]()
	@Published var incorrectLetters = [Character]()
	
	@Published var lives = ["a","a","a","a","a","a","a","a"]
	
	@Published var showingSettings : Bool = false
	@Published var showingStatistics : Bool = false
	@Published var showingShop : Bool = false
	
	@Published var gameOver : Int = 0
	
	static func getLetters() -> Array<Character> {
		let allWords = WordList.basicList
		let randomWord : String! = allWords.randomElement()
		let letters = Array(randomWord)
		print(letters)
		return letters
	}
}
