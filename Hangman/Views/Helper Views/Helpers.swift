//
//  HelperViews.swift
//  Hangman
//
//  Created by Alessia on 7/12/21.
//

import SwiftUI

struct ButtonView: View {
	var buttonLabel = String()
	var positionBottom: Bool
	var body: some View {
		
#if os(iOS)
		let screen = UIScreen.main.bounds
		ZStack{
			RoundedRectangle(cornerRadius: 15)
			Text(buttonLabel)
				.font(.system(size: 25, weight: .medium))
				.foregroundColor(.white)
		}
		.frame(width: screen.width - 100, height: 60)
		.padding()
#else
		ZStack{
			RoundedRectangle(cornerRadius: 15)
				.foregroundColor(.accentColor)
			Text(buttonLabel)
				.font(.system(size: 25, weight: .medium))
				.foregroundColor(.white)
		}
		.frame(width: 405, height: 60)
		.padding(.bottom, 22)
#endif
		
	}
}

struct KeyboardLetters {
	let allLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}

