//
//  GameOverView.swift
//  Hangman
//
//  Created by Alessia on 16/12/2021.
//

import SwiftUI

struct GameOverView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var gameData: GameData
	@ObservedObject var stats: Statistics
	
	
    var body: some View {
		if appData.gameOver == false {
			GameView(appData: appData, stats: stats, gameData: gameData)
		} else if appData.gameOver == true {
			ZStack{
				Color.black
					.ignoresSafeArea()
				VStack {
					Text("Game Over")
						.font(.system(size: 45, weight: .bold))
						.padding(.top, 50)
					Spacer()
					Text("The Word Was...")
						.font(.system(size: 25))
					HStack {
						ForEach(gameData.gameLetters, id: \.self) { letter in
							Text(String(letter))
						}
						.font(.system(size: 40, weight: .heavy))
					}
					.padding(.bottom, 100)
					Spacer()
					Button {
						appData.gameOver.toggle()
						gameData.gameLetters = AppData.getLetters()
						print("new game started")
						appData.usedLetters.removeAll()
						appData.correctLetters.removeAll()
						appData.incorrectLetters.removeAll()
						appData.lives = ["a","a","a","a","a","a","a","a"]
						
						stats.increment(key: "GamesPlayed")
					} label: {
						ButtonView(buttonLabel: "Try Again")
							.foregroundColor(.accentColor)
					}
				}
			}
			.foregroundColor(.white)
		}
    }
}

//struct GameOverView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOverView()
//    }
//}
