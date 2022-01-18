//
//  ResetDataView.swift
//  Hangman
//
//  Created by Alessia on 22/12/2021.
//

import SwiftUI

struct ResetDataView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var vm: GlobalViewModel
	@Binding var showingSheet: Bool
	var body: some View {
		VStack {
			Text("Erase All Data?")
				.font(.system(size: 40, weight: .bold))
				.padding(.top, 30)
			Text("This will include...")
				.font(.headline)
				.padding(5)
			List {
				Section {
					ListLabel(imageName: "dollarsign.circle", label: "All Money & Purchased Items")
				}
				Section {
					ListLabel(imageName: "book", label: "All Collected Word Packs")
				}
				Section {
					ListLabel(imageName: "list.bullet.rectangle", label: "All Statistics")
				}
			}
			.padding()
			.listStyle(.inset)
			Spacer()
			ResetButton(appData: appData, vm: vm, showingSheet: $showingSheet)
				.padding(30)
		}
	}
}

struct ResetButton: View {
	@ObservedObject var appData: AppData
	@ObservedObject var vm: GlobalViewModel
	@Binding var showingSheet: Bool
	@State private var showingAlert = false
	var body: some View {
		Button {
			showingAlert.toggle()
		} label: {
			Text("Confirm")
				.foregroundColor(.red)
		}
		.alert("Are You Sure? This is PERMINENT", isPresented: $showingAlert) {
			Button("Cancel", role: .cancel) {}
			Button("Reset", role: .destructive) {
				vm.defaults.set(0, forKey: "ButtonsPressed")
				vm.defaults.set(0, forKey: "GamesLost")
				vm.defaults.set(0, forKey: "GamesWon")
				vm.defaults.set(0, forKey: "CurrentWinStreak")
				vm.defaults.set(0, forKey: "GamesPlayed")
				vm.defaults.set(0, forKey: "CurrentMoney")
				vm.defaults.set(0, forKey: "MoneyObtained")
				vm.defaults.set(0, forKey: "MoneySpent")
				vm.defaults.set(0, forKey: "Hints")
				vm.defaults.set("", forKey: "SelectedColor")
				vm.defaults.set(0, forKey: "SelectedAppearance")
				vm.defaults.set(true, forKey: "LettersWhite")
				vm.defaults.set(false, forKey: "DebugActive")
				vm.defaults.set(true, forKey: "HapticFeedback")
				appData.gameLetters = AppData.getLetters()
				print("Game Reset")
				showingSheet.toggle()
				appData.showingSettings.toggle()
				vm.hexToColor()
			}
		}
	}
}
