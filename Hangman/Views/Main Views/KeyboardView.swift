//
//  KeyboardView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct KeyboardView: View {
	@State private var letters = KeyboardLetters()
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	@ObservedObject var gameData: GameData
	
	let columns = [
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem()
	]
	
	var body: some View {
		VStack{
			LazyVGrid(columns: columns){
				ForEach(letters.allLetters, id: \.self) { letter in
					Button {
						print("\(letter) button was pressed")
						appData.usedLetters.append(letter)
						
						var pressed = stats.defaults.integer(forKey: "ButtonsPressed")
						pressed += 1
						stats.defaults.set(pressed, forKey: "ButtonsPressed")
						
						if gameData.gameLetters.contains(Character(letter)) {
							
							if appData.hapticFeedback == true {
								Vibrations.heavyVibration()
							}
							
							print("true")
							appData.correctLetters.append(Character(letter))
							
							if checkLetters() == true {
								stats.increment(key: "GamesWon")
								print("game won")
							}
							
						} else {
							
							
							if appData.hapticFeedback == true {
								Vibrations.lightVibration()
							}
							
							print("false")
							appData.incorrectLetters.append(Character(letter))
							withAnimation{
								if appData.lives.count != 1 {
									appData.lives.remove(at: appData.lives.count-1)
								} else if appData.lives.count == 1{
									print("game over")
									appData.gameOver = true
									
									stats.increment(key: "ButtonsPressed")
								}
							}
						}
						
					} label: {
						ZStack{
							if appData.correctLetters.contains(Character(letter)) {
								LetterButtonView(color: .green)
							} else if appData.incorrectLetters.contains(Character(letter)){
								LetterButtonView(color: .red)
							} else {
								LetterButtonView(color: .accentColor)
							}
#if os(iOS)
							if UIDevice.current.userInterfaceIdiom == .pad {
								Text(letter)
									.foregroundColor(.white)
									.font(.system(size: 40, weight: .medium))
							} else {
								Text(letter)
									.foregroundColor(.white)
									.font(.system(size: 25, weight: .medium))
							}
#else
							Text(letter)
								.foregroundColor(.white)
								.font(.system(size: 25, weight: .medium))
#endif
							
							
						}
						.padding(6)
						
					}
					.disabled(appData.usedLetters.contains(letter))
				}
			}
		}
		.padding(.horizontal, 30)
	}
	func checkLetters() -> Bool {
		let gameLettersSet: Set<Character> = Set<Character>(gameData.gameLetters)
		let correctLettersSet: Set<Character> = Set<Character>(appData.correctLetters)
		
		if gameLettersSet == correctLettersSet {
			print("check letters true")
			return true
		} else {
			print("check letters false")
			return false
		}
	}
}

struct LetterButtonView: View {
	let color: Color
	
	var body: some View {
		
#if os(iOS)
		let screen = UIScreen.main.bounds
		if UIDevice.current.userInterfaceIdiom == .pad {
			RoundedRectangle(cornerRadius: 20)
				.frame(width: screen.width / 10, height: screen.width / 10)
				.foregroundColor(color)
		} else {
			RoundedRectangle(cornerRadius: 10)
				.frame(width: screen.width / 10, height: screen.width / 10)
				.foregroundColor(color)
		}
#else
		RoundedRectangle(cornerRadius: 10)
			.frame(width: 45, height: 45)
			.foregroundColor(color)
#endif
	}
}


