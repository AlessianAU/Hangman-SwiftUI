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
		Button {
			stats.defaults.set(0, forKey: "ButtonsPressed")
			stats.defaults.set(0, forKey: "GamesLost")
			stats.defaults.set(0, forKey: "GamesWon")
			stats.defaults.set(0, forKey: "CurrentWinStreak")
			stats.defaults.set(0, forKey: "GamesPlayed")
			stats.defaults.set(0, forKey: "CurrentMoney")
			stats.defaults.set(0, forKey: "MoneyObtained")
			stats.defaults.set(0, forKey: "MoneySpent")
			print("Stats Reset")
			showingSheet.toggle()
			appData.showingSettings.toggle()
		} label: {
			Text("Confirm")
		}

    }
}

//struct ResetDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetDataView()
//    }
//}
