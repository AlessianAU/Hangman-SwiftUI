//
//  StatisticsView.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import SwiftUI

struct StatisticsView: View {
	@ObservedObject var stats: Statistics
	
	var body: some View {
#if os(iOS)
		NavigationView {
			StatisticsList(stats: stats)
				.navigationBarTitle("Statistics")
		}
#else
		ZStack {
			StatisticsList(stats: stats)
		}
		.frame(width: 300, height: 400)
		
#endif
	}
}

//struct StatisticsView_Previews: PreviewProvider {
//	static var previews: some View {
//		StatisticsView(showingStatistics: $showingStatistics)
//	}
//}

struct StatisticsLabel: View {
	var imageColor: Color = .accentColor
	var imageName: String
	var label: String
	var statisticAmount: Int
	
	
	var body: some View {
		HStack{
			ListLabel(imageColor: imageColor, imageName: imageName, label: label)
			
			Spacer()
			
			Text(String(statisticAmount))
				.opacity(0.7)
				.font(.system(size: 17))
		}
		.frame(height: 30)
	}
}

struct StatisticsList: View {
	@ObservedObject var stats: Statistics
	var body: some View {
		List {
			Section{
				StatisticsLabel(imageName: "123.rectangle", label: "Games Played", statisticAmount: stats.played)
				StatisticsLabel(imageName: "checkmark.seal", label: "Games Won", statisticAmount: stats.won)
				StatisticsLabel(imageName: "xmark.diamond", label: "Games Lost", statisticAmount: stats.lossed)
			}
			Section {
				StatisticsLabel(imageName: "flame", label: "Current Win Streak", statisticAmount: stats.currentWinStreak)
				StatisticsLabel(imageName: "crown", label: "Longest Win Streak", statisticAmount: stats.longestWinStreak)
			}
			Section {
				StatisticsLabel(imageName: "exclamationmark.circle", label: "Current Loss Streak", statisticAmount: stats.currentLossStreak)
				StatisticsLabel(imageName: "xmark.octagon", label: "Longest Loss Streak", statisticAmount: stats.longestLossStreak)
			}
			Section {
				StatisticsLabel(imageName: "timer", label: "Average Time", statisticAmount: stats.averageTime)
				StatisticsLabel(imageName: "clock", label: "Total Time Played", statisticAmount: stats.totalTime)
			}
			Section {
				StatisticsLabel(imageName: "keyboard", label: "Total Buttons Pressed", statisticAmount: stats.pressed)
			}
		}
	}
}
