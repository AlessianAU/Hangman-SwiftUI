//
//  LettersView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct LettersView: View {
	@State var letters = KeyboardLetters()
	@Binding var usedLetters: [String]
	@Binding var gameLetters: [Character]
	@Binding var correctLetters: [Character]
	@Binding var incorrectLetters: [Character]
	
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
						usedLetters.append(letter)
						
						if gameLetters.contains(Character(letter)) {
							print("true")
							correctLetters.append(Character(letter))
						} else {
							print("false")
							incorrectLetters.append(Character(letter))
						}

					} label: {
						ZStack{
							RoundedRectangle(cornerRadius: 10)
								.frame(width: 40, height: 40)
							Text(letter)
								.foregroundColor(.white)
								.font(.system(size: 25, weight: .medium))
						}
						.padding(6)
						
					}
					.disabled(usedLetters.contains(letter))
				}
			}
		} .padding(.horizontal, 30)
	}
}
