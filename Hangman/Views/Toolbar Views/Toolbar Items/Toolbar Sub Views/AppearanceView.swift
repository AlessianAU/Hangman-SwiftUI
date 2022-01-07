//
//  ColorView.swift
//  Hangman
//
//  Created by Alessia on 5/1/2022.
//

import SwiftUI

struct AppearanceView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	@AppStorage("SelectedColor") var selectedColor = ""
	@AppStorage("LettersWhite") var letterColor = true
	@AppStorage("SelectedAppearance") var selectedAppearance = 0
	
	@State var showingAlert = false
	
	var body: some View {
		List {
			
			ColorPicker("Accent Color", selection: Binding(get: {
				stats.color
			}, set: { newColor in
				selectedColor = stats.uicolorToHex(color: newColor)
				stats.color = newColor
				stats.hexToColor()
			}), supportsOpacity: false)
				.swipeActions(edge: .trailing, allowsFullSwipe: false) {
					Button {
						showingAlert = true
					} label: {
						ZStack {
							Image(systemName: "paintpalette")
						}
					}
					.disabled(stats.defaults.string(forKey: "SelectedColor") == "")
				}
				.tint(Color(0xFFB000))
				.alert("Reset accent color to default color?",isPresented: $showingAlert) {
					Button("Cancel", role: .cancel) {  }
					Button("Reset Color") {
						stats.defaults.set("", forKey: "SelectedColor")
						stats.hexToColor()
					}
				}
			
			
			Toggle(letterColor ? "Letters are White" : "Letters are Black", isOn: $letterColor)
			
			
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
			
			
			
			Section{
				NavigationLink("Accessibility") {
					AccessibilityView()
				}
			}
		}
	}
}

struct AccessibilityView: View {
	@AppStorage("WithoutColor") var withoutColor: Bool = false
	var body: some View {
		List {
			Toggle("Differenciate Without Color", isOn: $withoutColor)
		}
	}
}
