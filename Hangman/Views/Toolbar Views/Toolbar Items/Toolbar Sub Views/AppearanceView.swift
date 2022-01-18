//
//  ColorView.swift
//  Hangman
//
//  Created by Alessia on 5/1/2022.
//

import SwiftUI

struct AppearanceView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var vm: GlobalViewModel
	
	@AppStorage("SelectedColor") var selectedColor = ""
	@AppStorage("LettersWhite") var letterColor = true
	@AppStorage("SelectedAppearance") var selectedAppearance = 0
	
	@State var showingAlert = false
	
	var body: some View {
		List {
			
			ColorPicker("Accent Color", selection: Binding(get: {
				vm.color
			}, set: { newColor in
				selectedColor = vm.uicolorToHex(color: newColor)
				vm.color = newColor
				vm.hexToColor()
			}), supportsOpacity: false)
				.swipeActions(edge: .trailing, allowsFullSwipe: false) {
					Button {
						showingAlert = true
					} label: {
						ZStack {
							Image(systemName: "paintpalette")
						}
					}
					.disabled(vm.defaults.string(forKey: "SelectedColor") == "")
				}
				.tint(Color(0xFFB000))
				.alert("Reset accent color to default color?",isPresented: $showingAlert) {
					Button("Cancel", role: .cancel) {  }
					Button("Reset Color") {
						vm.defaults.set("", forKey: "SelectedColor")
						vm.hexToColor()
					}
				}
			
			
			Toggle(letterColor ? "Letters are White" : "Letters are Black", isOn: $letterColor)
			
			
			HStack {
				Text("Theme")
					.padding(.trailing)
				Picker("", selection: $selectedAppearance) {
					Text("System")
						.tag(0)
					Text("Light")
						.tag(1)
					Text("Dark")
						.tag(2)
				}
				.pickerStyle(.segmented)
				.onChange(of: selectedAppearance) { newValue in
					appData.showingSettings = false
				}
			}
			
			
			
			
			Section{
				NavigationLink("Accessibility") {
					AccessibilityView(vm: vm)
				}
			}
		}
		.navigationTitle("Appearance")
	}
}

struct AccessibilityView: View {
	@ObservedObject var vm: GlobalViewModel
	
	@Environment(\.accessibilityDifferentiateWithoutColor) var withoutColorSystem
	@AppStorage("WithoutColor") var withoutColor: Bool = false
	
	var body: some View {
		List {
			Section {
				Toggle("Differenciate Without Color", isOn: $withoutColor)
					.disabled(withoutColorSystem == true)
			} footer: {
				if withoutColorSystem == true {
					Text("This option is disabled as differenciate without color is enabled globally")
				}
			}
		}
		.navigationTitle("Accessibility")
	}
}
