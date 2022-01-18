//
//  StatisticsView.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import SwiftUI

struct StatisticsView: View {
	@ObservedObject var vm: GlobalViewModel
	
	var body: some View {
#if os(iOS)
		TabView {
			NavigationView {
				StatisticsList(vm: vm)
					.navigationViewStyle(.stack)
			}
			.tabItem {
				VStack{
					Image(systemName: "textformat.123")
					Text("Statistics")
				}
			}
			NavigationView {
				AchievementsView(vm: vm)
					.navigationViewStyle(.stack)
			}
			.tabItem {
				VStack{
					Image(systemName: "crown")
					Text("Achievements")
				}
			}
		}
#else
		ZStack {
			StatisticsList(vm: vm)
		}
		.frame(width: 300, height: 400)
		
#endif
	}
}

struct StatisticsLabel: View {
//	var imageColor: Color = .accentColor
	var imageName: String
	var label: String
	var statisticAmount: Int
	
	
	var body: some View {
		HStack{
			ListLabel(imageName: imageName, label: label)
			
			Spacer()
			
			Text(String(statisticAmount))
				.opacity(0.7)
				.font(.system(size: 17))
		}
		.frame(height: 30)
	}
}

struct StatisticsList: View {
	@ObservedObject var vm: GlobalViewModel
	
	var body: some View {
		List {
			Section{
				StatisticsLabel(imageName: "123.rectangle", label: "Games Played", statisticAmount: vm.defaults.integer(forKey: "GamesPlayed"))
				StatisticsLabel(imageName: "checkmark.seal", label: "Games Won", statisticAmount: vm.defaults.integer(forKey: "GamesWon"))
				StatisticsLabel(imageName: "xmark.diamond", label: "Games Lost", statisticAmount: vm.defaults.integer(forKey: "GamesLost"))
			}
			Section {
				StatisticsLabel(imageName: "bag.circle", label: "Money Spent", statisticAmount: vm.defaults.integer(forKey: "MoneySpent"))
				StatisticsLabel(imageName: "dollarsign.circle", label: "Money Obtained", statisticAmount: vm.defaults.integer(forKey: "MoneyObtained"))
			}
			Section {
				StatisticsLabel(imageName: "flame", label: "Current Win Streak", statisticAmount: vm.defaults.integer(forKey: "CurrentWinStreak"))
				StatisticsLabel(imageName: "crown", label: "Longest Win Streak", statisticAmount: vm.defaults.integer(forKey: "LongestWinStreak"))
			}
			Section {
				StatisticsLabel(imageName: "exclamationmark.circle", label: "Current Loss Streak", statisticAmount: vm.defaults.integer(forKey: "CurrentLossStreak"))
				StatisticsLabel(imageName: "xmark.octagon", label: "Longest Loss Streak", statisticAmount: vm.defaults.integer(forKey: "LongestLossStreak"))
			}
			Section {
				StatisticsLabel(imageName: "timer", label: "Average Time*", statisticAmount: 0)
				StatisticsLabel(imageName: "clock", label: "Total Time Played*", statisticAmount: 0)
			}
			Section {
				StatisticsLabel(imageName: "keyboard", label: "Total Buttons Pressed", statisticAmount: vm.defaults.integer(forKey: "ButtonsPressed"))
			}
		}
		.navigationTitle("Statistics")
	}
}
