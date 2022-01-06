//
//  ColorView.swift
//  Hangman
//
//  Created by Alessia on 5/1/2022.
//

import SwiftUI

struct ColorView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	@AppStorage("SelectedColor") var selectedColor = ""
	@AppStorage("LettersWhite") var letterColor = true
	@AppStorage("SelectedAppearance") var selectedAppearance = 0
	
//	@State var color: Color = .yellow
	
	var body: some View {
		List {
			Section {
				ColorPicker("Change Color", selection: Binding(get: {
					stats.color
				}, set: { newColor in
					selectedColor = self.uicolorToHex(color: newColor)
					stats.color = newColor
					stats.hexToColor()
				}), supportsOpacity: false)
			}
			Section {
				Toggle(letterColor ? "Letters are White" : "Letters are Black", isOn: $letterColor)
			}
			Section {
				Picker("App Appearance", selection: $selectedAppearance) {
					Text("System")
						.tag(0)
					Text("Light")
						.tag(1)
					Text("Dark")
						.tag(2)
				}
				.onChange(of: selectedAppearance) { newValue in
					appData.showingSettings = false
				}
			}
		}
	}
	
	///	Converts UIColor to Hexidecimal to store in UserDefaults
	func uicolorToHex(color: Color) -> String {
		let uiColor = UIColor(color)
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		
		uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		
		return "\(red),\(green),\(blue),\(alpha)"
	}
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorView()
//    }
//}
