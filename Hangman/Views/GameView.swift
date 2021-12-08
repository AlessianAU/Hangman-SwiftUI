//
//  GameView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct GameView: View {
	@State private var showingAlert = false
	@State var usedLetters = [String]()
	@State var gameLetters:Array = ContentView.getLetters()
	@State var correctLetters = [Character]()
	@State var incorrectLetters = [Character]()
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				ForEach(gameLetters, id: \.self) { letter in
					
					if correctLetters.contains(letter) {
						Text(String(letter))
							.font(.system(size: 35, weight: .medium))
					} else {
						RoundedRectangle(cornerRadius: 10)
							.frame(width: 30, height: 5)
							.offset(y: 10)
					}
					
				}
				.frame(width: 30, height: 40)
			}
			
			HStack{
				ForEach(0..<6) {_ in
					Image(systemName: "heart.fill")
						.foregroundColor(.red)
						.padding(.top)
				}
			}
			
			
#if DEBUG
			HStack {
				Text("Word")
				ForEach(gameLetters, id: \.self) { letter in
				Text(String(letter))
				}
				Spacer()
			}

			
			HStack {
				Text("Correct")
				ForEach(correctLetters, id: \.self) { letter in
				Text(String(letter))
				}
				Spacer()
			}
			
			HStack {
				Text("Incorrect")
				ForEach(incorrectLetters, id: \.self) { letter in
				Text(String(letter))
				}
				Spacer()
			}
#endif
			Spacer()
			LettersView(usedLetters: $usedLetters, gameLetters: $gameLetters, correctLetters: $correctLetters, incorrectLetters: $incorrectLetters)
			
			Spacer()
			
			Button {
				print("new game button pressed")
				showingAlert = true
			} label: {
				ButtonView(buttonLabel: "New Game")
			}
			.alert("Are You Sure", isPresented: $showingAlert) {
				Button("No", role: .cancel) { print("new game cancelled") }
				Button("Yes") {
					gameLetters = ContentView.getLetters()
					print("new game started")
					usedLetters.removeAll()
					correctLetters.removeAll()
					incorrectLetters.removeAll()
				}
			}
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
	}
}


