//
//  DebugView.swift
//  Hangman
//
//  Created by Alessia on 10/12/21.
//

import SwiftUI

struct DebugView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var gameData: GameData
	
	@State var safe = 0
	
	var body: some View {
		VStack{
			HStack {
				Text("Word")
				ForEach(gameData.gameLetters, id: \.self) { letter in
					Text(String(letter))
				}
				Spacer()
			}

			HStack {
				Text("Correct")
				ForEach(appData.correctLetters, id: \.self) { letter in
					Text(String(letter))
				}
				Spacer()
			}

			HStack {
				Text("Incorrect")
				ForEach(appData.incorrectLetters, id: \.self) { letter in
					Text(String(letter))
				}
				Spacer()
			}
		}.padding()
	}
}
