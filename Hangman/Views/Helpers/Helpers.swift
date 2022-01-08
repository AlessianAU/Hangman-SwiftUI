//
//  HelperViews.swift
//  Hangman
//
//  Created by Alessia on 7/12/21.
//

import SwiftUI

struct ButtonView: View {
	@ObservedObject var stats: Statistics
	@AppStorage("LettersWhite") var lettersWhite: Bool = true
	
	var buttonLabel = String()
	var body: some View {
		
#if os(iOS)
		let screen = UIScreen.main.bounds
		ZStack{
			RoundedRectangle(cornerRadius: 13)
			Text(buttonLabel)
				.font(.system(size: 25, weight: .medium))
				.foregroundColor(lettersWhite ? .white : .black)
		}
		.frame(width: screen.width - 100, height: 60)
		.padding()
#else
		ZStack{
			RoundedRectangle(cornerRadius: 13)
				.foregroundColor(stats.color)
			Text(buttonLabel)
				.font(.system(size: 25, weight: .medium))
				.foregroundColor(lettersWhite ? .white : .black)
		}
		.frame(width: 405, height: 60)
		.padding(.bottom, 22)
#endif
		
	}
}

struct ListLabel: View {
	@AppStorage("SelectedColor") var selectedColors = ""
	@State var color: Color = .accentColor
	@State var imageName: String
	@State var label: String
	@State var destructive: Bool? = false
	
	var body: some View {
		HStack{
			Image(systemName: imageName)
				.padding(6)
				.foregroundColor(destructive! ? .red : color)
				.frame(width: 25)
				.padding(.trailing, 10)
			Text(label)
		}
		.onAppear(perform: {
			convertColor()
		})
		.frame(height: 30)
	}
	
	///Only reason this is here is because id have to put 'stats' into every instance of this struct and im lazy
	func convertColor() {
		let selectedColor = selectedColors
		if (selectedColor != "") {
			let rgbArray = selectedColor.components (separatedBy: ",")
			if let red = Double(rgbArray[0]), let green = Double(rgbArray[1]), let blue = Double(rgbArray[2]) {
				color = Color(.sRGB, red: red, green: green, blue: blue)
			}
		} else {
			color = Color(0xFFB000)
		}
	}
}


struct KeyboardLetters {
	let allLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
}

extension View {
	func hideKeyboard() {
#if canImport(UIKit)
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
#endif
	}
}


extension Array where Element: Hashable {
	func difference(from other: [Element]) -> [Element] {
		let thisSet = Set(self)
		let otherSet = Set(other)
		return Array(thisSet.symmetricDifference(otherSet))
	}
}

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
	self.init(
	  .sRGB,
	  red: Double((hex >> 16) & 0xFF) / 255,
	  green: Double((hex >> 8) & 0xFF) / 255,
	  blue: Double(hex & 0xFF) / 255,
	  opacity: alpha
	)
  }
}
