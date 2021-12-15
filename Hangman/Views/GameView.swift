//
//  GameView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct GameView: View {
	@State private var showingAlert = false
	@State private var usedLetters = [String]()
	@State private var gameLetters:Array = ContentView.getLetters()
	@State private var correctLetters = [Character]()
	@State private var incorrectLetters = [Character]()
	@State private var lives = ["a","a","a","a","a","a","a","a"]
	
	@Binding var debugActive: Bool
	
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
							.frame(width: 25, height: 4)
							.offset(y: 12)
					}
					
					
					
				}
				.frame(width: 30, height: 40)
			}
			
			HStack{
				ForEach(lives, id: \.self) { life in
					Image(systemName: "heart.fill")
						.foregroundColor(.red)
						.padding(.top)
				}
			}
						.frame(height: 60)
			

#if DEBUG
			if debugActive == true {
			DebugView(gameLetters: $gameLetters, correctLetters: $correctLetters, incorrectLetters: $incorrectLetters)
		}
#endif
			Spacer()
			LettersView(usedLetters: $usedLetters, gameLetters: $gameLetters, correctLetters: $correctLetters, incorrectLetters: $incorrectLetters, lives: $lives)
			
			Spacer()
			
			Button {
				print("new game button pressed")
				showingAlert = true
			} label: {
				ButtonView(buttonLabel: "New Game", positionBottom: true)
			}
			.alert("Are You Sure", isPresented: $showingAlert) {
				Button("No", role: .cancel) { print("new game cancelled") }
				Button("Yes") {
					gameLetters = ContentView.getLetters()
					print("new game started")
					usedLetters.removeAll()
					correctLetters.removeAll()
					incorrectLetters.removeAll()
					lives = ["a","a","a","a","a","a","a","a"]
				}
			}
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView(debugActive: .constant(false))
	}
}


