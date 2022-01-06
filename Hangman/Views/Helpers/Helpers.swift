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
//	@State var imageColor: Color = stats.color
	@State var imageName: String
	@State var label: String
	
	var body: some View {
		HStack{
			Image(systemName: imageName)
				.padding(6)
//				.foregroundColor(imageColor)
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

private struct TintKey: EnvironmentKey {
	static let defaultValue: Color = Color.blue
}

extension EnvironmentValues {
	var tintColor: Color {
		get { self[TintKey.self] }
		set { self[TintKey.self] = newValue }
	}
}
