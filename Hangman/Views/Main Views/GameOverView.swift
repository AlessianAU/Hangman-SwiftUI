//
//  GameOverView.swift
//  Hangman
//
//  Created by Alessia on 16/12/2021.
//

import SwiftUI

struct GameOverView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var vm: GlobalViewModel
	
	@State private var showingDefinition = false
	
	var body: some View {
		if appData.gameOver == 0 {
			GameView(appData: appData, vm: vm)
		} else {
			ZStack{
				Color.black
					.ignoresSafeArea()
				VStack {
					Group {
						Text(appData.gameOver == 2 ? "Correct" : "Game Over")
							.font(.system(size: 45, weight: .bold))
							.padding(.top, 50)
						Spacer()
						Text(appData.gameOver == 2 ? "The Word Was" : "The Word Was...")
							.font(.system(size: 25))
						Text(String(appData.gameLetters))
							.font(.system(size: 40, weight: .heavy))
						Button {
							showingDefinition = true
						} label: {
							ZStack {
								RoundedRectangle(cornerRadius: 10)
									.foregroundColor(.gray)
									.opacity(0.2)
								Text("Definition")
									.foregroundColor(.white)
									.opacity(0.5)
							}
						}
						.frame(width: 100, height: 40)
						.sheet(isPresented: $showingDefinition) {
							DefinitionView(appData: appData)
						}

						Spacer()
					}
					.foregroundColor(.white)
					
					Spacer()
					Button {
						
						if appData.gameOver == 1 {
							vm.increaseDefaults(key: "GamesPlayed")
							vm.increaseDefaults(key: "GamesLost")
							vm.streak(win: false)
						} else {
							vm.increaseDefaults(key: "GamesPlayed")
							vm.increaseDefaults(key: "GamesWon")
							vm.streak(win: true)
						}
						
						
						
						appData.gameOver = 0
						appData.gameLetters = AppData.getLetters()
						print("--new game started--")
						appData.usedLetters.removeAll()
						if appData.gameLetters.contains(" ") {
							appData.correctLetters = [" "]
						} else {
							appData.correctLetters.removeAll()
						}
						appData.incorrectLetters.removeAll()
						appData.lives = ["a","a","a","a","a","a","a","a"]
					} label: {
						ButtonView(vm: vm, buttonLabel: "New Word")
					}
				}
			}
		}
	}
}

//struct GameOverView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOverView()
//    }
//}
