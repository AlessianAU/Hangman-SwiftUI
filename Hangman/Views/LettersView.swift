//
//  LettersView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct LettersView: View {
	@State private var letters = KeyboardLetters()
	@ObservedObject var vm: LettersModel
	@Binding var lives: [String]
	
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
						vm.usedLetters.append(letter)
						
						if vm.gameLetters.contains(Character(letter)) {
							print("true")
							vm.correctLetters.append(Character(letter))
							if checkLetters() == true {
								print("game won")
							}
						} else {
							print("false")
							vm.incorrectLetters.append(Character(letter))
							withAnimation{
								if lives.count != 0 {
									lives.remove(at: lives.count-1)
								} else if lives.count == 0{
									print("game over")
								}
							}
						}
						
					} label: {
						ZStack{
							if vm.correctLetters.contains(Character(letter)) {
								LetterButtonView(color: .green)
							} else if vm.incorrectLetters.contains(Character(letter)){
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
					.disabled(vm.usedLetters.contains(letter))
				}
			}
		}
		.padding(.horizontal, 30)
	}
	func checkLetters() -> Bool {
		if vm.gameLetters == vm.correctLetters {
			return true
		} else {
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


