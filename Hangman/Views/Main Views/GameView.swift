//
//  GameView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct GameView: View {
	@Environment(\.colorScheme) var colorScheme
	
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	@State private var showingAlert = false
	@State private var showingGuesser = false
	
	var body: some View {
		ZStack {
			Color(colorScheme == .light ? .white : .black)
				.ignoresSafeArea()
				.onTapGesture {
					hideKeyboard()
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
						withAnimation {
							showingGuesser = false
						}
					}
				}
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
									.font(.system(size: 35, weight: .medium))
							} else {
								RoundedRectangle(cornerRadius: 10)
									.frame(width: 25, height: 4)
									.offset(y: 9)
							}
						}
					}
					.frame(width: 35, height: 40)
				}
				
				HStack{
					ForEach(appData.lives, id: \.self) {_ in
						Image(systemName: "heart.fill")
							.foregroundColor(.red)
							.padding(.top)
					}
				}
				.frame(height: 60)
				
				if appData.debugViewActive == true {
					DebugView(appData: appData, stats: stats)
						.padding(.leading)
				}
				
				Spacer()
				
				KeyboardView(appData: appData, stats: stats, showingGuesser: $showingGuesser)
				
				Spacer()
				
				Button {
					print("new game button pressed")
					showingAlert = true
				} label: {
					ButtonView(buttonLabel: "Give Up")
				}
				.alert("Are You Sure", isPresented: $showingAlert) {
					Button("No", role: .cancel) { print("new game cancelled") }
					Button("Yes") {
						appData.gameOver = 1
					}
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


