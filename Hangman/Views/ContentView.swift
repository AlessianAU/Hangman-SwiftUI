//
//  ContentView.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI

struct ContentView: View {
	@State private var gameActive = false
	
	var body: some View {
			VStack {
				if gameActive == true {
					GameView()
				} else {
					Button {
						gameActive = true
					} label: {
						ButtonView(buttonLabel: "Start Game", positionBottom: false)
					}
				}
			}
		

#if os(macOS)
		.frame(width: 450, height: 600)
		.buttonStyle(.plain)
		.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
					for window in NSApplication.shared.windows {
						window.standardWindowButton(.zoomButton)?.isEnabled = false
					}
				})
		
		
#endif
		.toolbar {
			ToolbarItemGroup(placement: .automatic) {
				Button{

				} label: {
					Image(systemName: "gearshape")
				}
				Button{

				} label: {
					Image(systemName: "list.bullet.rectangle")
				}
			}
		}
	}
	static func getLetters() -> Array<Character> {
		let allWords = WordList.wordList
		let randomWord : String! = allWords.randomElement()
		let letters = Array(randomWord)
		print(letters)
		print(type(of: letters))
		return letters
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

