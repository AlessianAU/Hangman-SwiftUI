//
//  GameView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct GameView: View {
	@ObservedObject var appData: AppData
	
	
	@State private var showingAlert = false
	@State private var lives = ["a","a","a","a","a","a","a","a"]
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				ForEach(appData.gameLetters, id: \.self) { letter in
					
					if appData.correctLetters.contains(letter) {
						Text(String(letter))
							.font(.system(size: 35, weight: .medium))
					} else {
						RoundedRectangle(cornerRadius: 10)
							.frame(width: 25, height: 4)
							.offset(y: 10)
					}
				}
				.frame(width: 35, height: 40)
			}
			
			HStack{
				ForEach(lives, id: \.self) {_ in
					Image(systemName: "heart.fill")
						.foregroundColor(.red)
						.padding(.top)
				}
			}
			.frame(height: 60)
			
			if appData.debugActive == true {
				DebugView(appData: appData)
					.padding(.leading)
			}
			
			Spacer()
			
			KeyboardView(appData: appData, lives: $lives)
			
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
					appData.gameLetters = AppData.getLetters()
					print("new game started")
					appData.usedLetters.removeAll()
					appData.correctLetters.removeAll()
					appData.incorrectLetters.removeAll()
					lives = ["a","a","a","a","a","a","a","a"]
				}
			}
		}
	}
}

//struct GameView_Previews: PreviewProvider {
//	static var previews: some View {
//		GameView(appData: appData, debugActive: .constant(false))
//	}
//}


