//
//  StatisticsView.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import SwiftUI

struct StatisticsView: View {
//	@Binding var showingStatistics: Bool
	var body: some View {
#if os(iOS)
		NavigationView {
			StatisticsList()
				.navigationBarTitle("Statistics")
		}
#else
		ZStack {
//			Spacer()
//			Button {
//				showingStatistics = false
//			} label: {
//				Text("Done")
//					.font(.system(size: 20))
//					.foregroundColor(.accentColor)
//			}
//			.buttonStyle(.plain)

			StatisticsList()
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
	var statisticAmount: Int = 0
	var imageColor: Color = .accentColor
	var imageName: String
	var label: String
	
	
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
	var body: some View {
		List {
			Section{
				StatisticsLabel(imageName: "123.rectangle", label: "Games Played")
				StatisticsLabel(imageName: "checkmark.seal", label: "Games Won")
				StatisticsLabel(imageName: "xmark.diamond", label: "Games Lost")
			}
			Section {
				StatisticsLabel(imageName: "flame", label: "Win Streak")
			}
			Section {
				StatisticsLabel(imageName: "keyboard", label: "Total Buttons Pressed")
			}
		}
	}
}
