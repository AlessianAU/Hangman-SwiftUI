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
	
	@AppStorage("LettersWhite") var lettersWhite: Bool = true
	@Environment(\.accessibilityDifferentiateWithoutColor) var withoutColorSystem
	@AppStorage("WithoutColor") var withoutColor: Bool = false
	
	@State private var showHints = false
	@State private var showingHintShop = false
	@Binding var showingGuesser: Bool
	@FocusState var guesser: Bool
	
	let columns = [
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem()
	]
	
	var body: some View {
		if showingGuesser == true {
			GuessWordView(appData: appData, stats: stats, showingGuesser: $showingGuesser)
				.focused($guesser)
				.padding(.horizontal, 35)
		}
		LazyVGrid(columns: columns){
			if showingGuesser == true {
			} else {
				ForEach(letters.allLetters, id: \.self) { letter in
					
					Button {
						//MARK: Letter Functions
						print("\(letter) button was pressed")
						appData.usedLetters.append(letter)
						
						stats.increment(key: "ButtonsPressed")
						
						if appData.gameLetters.contains(Character(letter)) {
							

								Vibrations.heavyVibration()
//
							
							stats.increment(key: "CurrentMoney")
							stats.increment(key: "MoneyObtained")
							print("true")
							appData.correctLetters.append(Character(letter))
							
							if checkLetters() == true {
								stats.increment(key: "CurrentMoney", amount: 4)
								stats.increment(key: "MoneyObtained", amount: 4)
								appData.gameOver = 2
								print("game won")
							}
							
						} else {
							
							
								Vibrations.lightVibration()
							
							
							print("false")
							appData.incorrectLetters.append(Character(letter))
							withAnimation{
								if appData.lives.count != 1 {
									appData.lives.remove(at: appData.lives.count-1)
								} else if appData.lives.count == 1{
									print("game over")
									appData.gameOver = 1
								}
							}
						}
						
					} label: {
						ZStack{
							//MARK: Letter Labels
							if appData.correctLetters.contains(Character(letter)) {
								ZStack {
									LetterButtonBackgroundView(color: .green)
									if (withoutColorSystem || withoutColor) == true {
										Image(systemName: "checkmark")
											.foregroundColor(lettersWhite ? .black : .white)
											.font(.system(size: 30, weight: .bold))
											.opacity(0.5)
									}
								}
							} else if appData.incorrectLetters.contains(Character(letter)){
								ZStack {
									LetterButtonBackgroundView(color: .red)
									if (withoutColorSystem || withoutColor) == true {
										Image(systemName: "xmark")
											.foregroundColor(lettersWhite ? .black : .white)
											.font(.system(size: 30, weight: .bold))
											.opacity(0.5)
									}
								}
							} else {
								LetterButtonBackgroundView(color: stats.color)
							}
							LetterButtonView( letter: letter)
						}
						.padding(6)
						
					}
					.disabled(appData.usedLetters.contains(letter))
					
				}
				
				//MARK: Misc Buttons
				Button {
					withAnimation {
						showingGuesser = true
						guesser = true
					}
				} label: {
					ZStack{
						LetterButtonBackgroundView(color: stats.color)
						LetterButtonView( letter: "", symbol: "magnifyingglass")
					}
				}
				
				Button {
					showHints.toggle()
				} label: {
					ZStack{
						LetterButtonBackgroundView(color: stats.color)
						LetterButtonView(letter: "", symbol: "questionmark.circle")
					}
				}
				.alert(stats.defaults.integer(forKey: "Hints") == 0 ? "You have no hints left..." : "Use a Hint? You have \(stats.defaults.integer(forKey: "Hints")) Left",isPresented: $showHints, actions: {
					Button("Cancel", role: .cancel) {}
					if stats.defaults.integer(forKey: "Hints") >= 1 {
						Button("Use") {
							print("hint used")
							stats.subtract(key: "Hints")
							if useHint() == true {
								appData.gameOver = 2
							}
						}
					} else {
						Button("Purchase") {
							showingHintShop = true
						}
					}
				})
				.sheet(isPresented: $showingHintShop) {
					NavigationView{
						HintView(stats: stats)
							.navigationTitle("Purchase Hints")
					}
				}
			}
		}
		.transition(.opacity)
		.padding(.horizontal, 30)
	}
	
	//MARK: Methods
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
	
	func useHint() -> Bool {
		
		let difference = appData.gameLetters.difference(from: appData.correctLetters)
		appData.correctLetters.append(difference.randomElement()!)
		
		return checkLetters()
	}
}

//MARK: Letter Button Background
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

//MARK: Letter Button
struct LetterButtonView: View {
	
	@AppStorage("LettersWhite") var lettersWhite: Bool = true
	
	var letter: String
	var symbol: String?
	var body: some View {
#if os(iOS)
		if UIDevice.current.userInterfaceIdiom == .pad {
			Group{
				if symbol != nil {
					Image(systemName: symbol!)
						.foregroundColor(lettersWhite ? .white : .black)
						.font(.system(size: 40, weight: .medium))
				} else {
					Text(letter)
						.foregroundColor(lettersWhite ? .white : .black)
						.font(.system(size: 40, weight: .medium))
				}
			}
		} else {
			Group{
				if symbol != nil {
					Image(systemName: symbol!)
						.foregroundColor(lettersWhite ? .white : .black)
						.font(.system(size: 25, weight: .medium))
				} else {
					Text(letter)
						.foregroundColor(lettersWhite ? .white : .black)
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


