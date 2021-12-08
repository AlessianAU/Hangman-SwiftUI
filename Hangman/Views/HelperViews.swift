//
//  HelperViews.swift
//  Hangman
//
//  Created by Alessia on 7/12/21.
//

import SwiftUI

struct ButtonView: View {
	let screen = UIScreen.main.bounds
	var buttonLabel = String()
	var body: some View {
		ZStack{
			RoundedRectangle(cornerRadius: 15)
			Text(buttonLabel)
				.font(.system(size: 25, weight: .medium))
				.foregroundColor(.white)
		}
		.frame(width: screen.width - 100, height: 60)
		.padding()
		
	}
}

struct KeyboardLetters {
	let allLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}

