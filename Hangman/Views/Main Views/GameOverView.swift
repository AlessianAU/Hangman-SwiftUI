//
//  GameOverView.swift
//  Hangman
//
//  Created by Alessia on 16/12/2021.
//

import SwiftUI

struct GameOverView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	var body: some View {
		if appData.gameOver == 0 {
			GameView(appData: appData, stats: stats)
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
						HStack {
							ForEach(appData.gameLetters, id: \.self) { letter in
								Text(String(letter))
							}
							.font(.system(size: 40, weight: .heavy))
						}
					}
					.foregroundColor(.white)
					.padding(.bottom, 100)
					Spacer()
					Button {
						
						if appData.gameOver == 1 {
							stats.increment(key: "GamesPlayed")
							stats.increment(key: "GamesLost")
							stats.streak(win: false)
						} else {
							stats.increment(key: "GamesPlayed")
							stats.increment(key: "GamesWon")
							stats.streak(win: true)
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
						ButtonView(stats: stats, buttonLabel: "New Word")
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
