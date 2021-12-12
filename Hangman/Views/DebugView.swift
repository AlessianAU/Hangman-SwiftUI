//
//  DebugView.swift
//  Hangman
//
//  Created by Alessia on 10/12/21.
//

import SwiftUI

struct DebugView: View {
	@Binding var gameLetters: [Character]
	@Binding var correctLetters: [Character]
	@Binding var incorrectLetters: [Character]
	
	var body: some View {
		VStack{
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
		}.padding()
	}
}

//struct DebugView_Previews: PreviewProvider {
//    static var previews: some View {
//		DebugView(gameLetters: $gameLetters, correctLetters: $correctLetters, incorrectLetters: $incorrectLetters)
//    }
//}
