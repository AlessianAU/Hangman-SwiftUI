//
//  ContentView.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI

struct ContentView: View {
	@State var gameActive = false
	
	var body: some View {
		VStack {
			if gameActive == true {
				GameView()
			} else {
				Button {
					gameActive = true
				} label: {
					ButtonView(buttonLabel: "Start Game")
				}
			}
		}
		.buttonStyle(.borderless)
	}
	static func getLetters() -> Array<Character> {
		let allWords = WordList.wordList
		let randomWord : String! = allWords.randomElement()
		let letters = Array(randomWord)
		print(letters)
		print(type(of: letters))
		return letters
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

