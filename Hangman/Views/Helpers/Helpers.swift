//
//  HelperViews.swift
//  Hangman
//
//  Created by Alessia on 7/12/21.
//

import SwiftUI

struct ButtonView: View {
	var buttonLabel = String()
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

struct ListLabel: View {
	@State var imageColor: Color = .accentColor
	@State var imageName: String
	@State var label: String
	
	var body: some View {
		HStack{
			Image(systemName: imageName)
				.padding(6)
				.foregroundColor(imageColor)
				.frame(width: 25)
				.padding(.trailing, 10)
			Text(label)
		}
		.frame(height: 30)
	}
}


struct KeyboardLetters {
	let allLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}

