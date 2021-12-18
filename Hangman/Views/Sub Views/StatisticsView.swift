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
	var statisticAmount: Int = 0
	
	
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
				StatisticsLabel(imageName: "flame", label: "Win Streak", statisticAmount: stats.streaks)
			}
			Section {
				StatisticsLabel(imageName: "keyboard", label: "Total Buttons Pressed", statisticAmount: stats.pressed)
			}
		}
	}
}
