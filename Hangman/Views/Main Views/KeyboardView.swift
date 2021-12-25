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
	
	@State private var showHints = false
	
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
						
						stats.increment(key: "ButtonsPressed")
						
						if appData.gameLetters.contains(Character(letter)) {
							
							if appData.hapticFeedback == true {
								Vibrations.heavyVibration()
							}
							
							stats.increment(key: "CurrentMoney")
							stats.increment(key: "MoneyObtained")
							print("true")
							appData.correctLetters.append(Character(letter))
							
							if checkLetters() == true {
								stats.increment(key: "CurrentMoney", amount: 4)
								stats.increment(key: "MoneyObtained", amount: 4)
								stats.increment(key: "GamesWon")
								stats.increment(key: "GamesPlayed")
								appData.gameOver = 2
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
									appData.gameOver = 1
									
									stats.increment(key: "GamesPlayed")
									stats.increment(key: "GamesLost")
								}
							}
						}
						
					} label: {
						ZStack{
							if appData.correctLetters.contains(Character(letter)) {
								LetterButtonBackgroundView(color: .green)
							} else if appData.incorrectLetters.contains(Character(letter)){
								LetterButtonBackgroundView(color: .red)
							} else {
								LetterButtonBackgroundView(color: .accentColor)
							}
							LetterButtonView(letter: letter)
							
							
						}
						.padding(6)
						
					}
					.disabled(appData.usedLetters.contains(letter))
				}
				
				Button {
					
				} label: {
					ZStack{
						LetterButtonBackgroundView(color: .accentColor)
						LetterButtonView(letter: "", symbol: "magnifyingglass")
					}
				}
				
				Button {
					showHints.toggle()
				} label: {
					ZStack{
						LetterButtonBackgroundView(color: .accentColor)
						LetterButtonView(letter: "", symbol: "questionmark.circle")
					}
				}
				.alert("Use a Hint? You have \(stats.defaults.integer(forKey: "Hints")) Left",isPresented: $showHints, actions: {
					Button("No", role: .cancel) { print("hint cancelled") }
					if stats.defaults.integer(forKey: "Hints") >= 1 {
						Button("Yes") {
							stats.subtract(key: "Hints")
						}
					} else {
						Button("Go to Store") {
							appData.showingShop = true
						}
					}
				})
			}
		}
		
		.padding(.horizontal, 30)
	}
	//	checks if game is won
	func checkLetters() -> Bool {
		let gameLettersSet: Set<Character> = Set<Character>(appData.gameLetters)
		let correctLettersSet: Set<Character> = Set<Character>(appData.correctLetters)
		
		if gameLettersSet == correctLettersSet {
			return true
		} else {
			return false
		}
	}
}

struct LetterButtonBackgroundView: View {
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

struct LetterButtonView: View {
	var letter: String
	var symbol: String?
	var body: some View {
#if os(iOS)
		if UIDevice.current.userInterfaceIdiom == .pad {
			Group{
				if symbol != nil {
					Image(systemName: symbol!)
						.foregroundColor(.white)
						.font(.system(size: 40, weight: .medium))
				} else {
					Text(letter)
						.foregroundColor(.white)
						.font(.system(size: 40, weight: .medium))
				}
			}
		} else {
			Group{
				if symbol != nil {
					Image(systemName: symbol!)
						.foregroundColor(.white)
						.font(.system(size: 25, weight: .medium))
				} else {
					Text(letter)
						.foregroundColor(.white)
						.font(.system(size: 25, weight: .medium))
				}
			}
		}
#else
		Group{
			if symbol != nil {
				Image(systemName: symbol!)
					.foregroundColor(.white)
					.font(.system(size: 25, weight: .medium))
			} else {
				Text(letter)
					.foregroundColor(.white)
					.font(.system(size: 25, weight: .medium))
			}
		}
#endif
	}
}


