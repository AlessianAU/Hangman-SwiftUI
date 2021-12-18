//
//  GameView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct GameView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	@State private var showingAlert = false
	@State private var lives = ["a","a","a","a","a","a","a","a"]
	
#if os(iOS)
	let screen = UIScreen.main.bounds
#endif
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				ForEach(appData.gameLetters, id: \.self) { letter in
					if letter == " " {
						Text(" ")
							.frame(width: 15)
					} else {
						if appData.correctLetters.contains(letter) {
							Text(String(letter))
#if os(iOS)
								.font(.system(size: screen.width * 0.08, weight: .medium))
#else
								.font(.system(size: 35, weight: .medium))
#endif
						} else {
							RoundedRectangle(cornerRadius: 10)
#if os(iOS)
								.frame(width: screen.width - 350, height: 4)
#else
								.frame(width: 25, height: 4)
#endif
								.offset(y: 9)
						}
					}
				}
#if os(iOS)
				.frame(width: screen.width - 350, height: 40)
#else
				.frame(width: 35, height: 40)
#endif
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
			
			KeyboardView(appData: appData, stats: stats, lives: $lives)
			
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
					if (appData.correctLetters != appData.gameLetters) && (lives == []){
						stats.lossed += 1
					}
					appData.gameLetters = AppData.getLetters()
					print("new game started")
					appData.usedLetters.removeAll()
					appData.correctLetters.removeAll()
					appData.incorrectLetters.removeAll()
					lives = ["a","a","a","a","a","a","a","a"]
					stats.lossed += 1
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


