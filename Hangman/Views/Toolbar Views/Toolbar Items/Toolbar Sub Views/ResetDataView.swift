//
//  ResetDataView.swift
//  Hangman
//
//  Created by Alessia on 22/12/2021.
//

import SwiftUI

struct ResetDataView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
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
			ResetButton(appData: appData, stats: stats, showingSheet: $showingSheet)
				.padding(30)
		}
	}
}

struct ResetButton: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
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
				stats.defaults.set(0, forKey: "ButtonsPressed")
				stats.defaults.set(0, forKey: "GamesLost")
				stats.defaults.set(0, forKey: "GamesWon")
				stats.defaults.set(0, forKey: "CurrentWinStreak")
				stats.defaults.set(0, forKey: "GamesPlayed")
				stats.defaults.set(0, forKey: "CurrentMoney")
				stats.defaults.set(0, forKey: "MoneyObtained")
				stats.defaults.set(0, forKey: "MoneySpent")
				stats.defaults.set(0, forKey: "Hints")
				stats.defaults.set("", forKey: "SelectedColor")
				stats.defaults.set(0, forKey: "SelectedAppearance")
				stats.defaults.set(true, forKey: "LettersWhite")
				print("Game Reset")
				showingSheet.toggle()
				appData.showingSettings.toggle()
				stats.hexToColor()
			}
		}
	}
}
