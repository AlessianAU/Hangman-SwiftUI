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
	
	var body: some View {
		List {
			Section {
				ColorPicker("Change Color", selection: Binding(get: {
					stats.color
				}, set: { newColor in
					selectedColor = stats.uicolorToHex(color: newColor)
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
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorView()
//    }
//}
