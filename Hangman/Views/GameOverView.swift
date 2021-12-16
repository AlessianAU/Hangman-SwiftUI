//
//  GameOverView.swift
//  Hangman
//
//  Created by Alessia on 16/12/2021.
//

import SwiftUI

struct GameOverView: View {
	@ObservedObject var vm = Letters()
    var body: some View {
		ZStack{
			Color.black
				.ignoresSafeArea()
			VStack {
				Text("Game Over")
					.font(.system(size: 45, weight: .bold))
					.padding(.top, 50)
				Spacer()
				Text("The Word Was...")
					.font(.headline)
				HStack {
					ForEach(vm.gameLetters, id: \.self) { letter in
						Text(String(letter))
					}
					.font(.system(size: 25, weight: .heavy))
				}
				.padding(.bottom, 100)
				Spacer()
			}
		}
		.foregroundColor(.white)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
