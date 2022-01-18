//
//  AchievementsView.swift
//  Hangman
//
//  Created by Alessia on 27/12/2021.
//

import SwiftUI

struct AchievementsView: View {
	@ObservedObject var vm: GlobalViewModel
	
	var body: some View {
		HStack {
			List {
				Section(header: Text("Comleted Acheivements")) {
					ForEach(0..<4, id: \.self) {_ in
						StatisticsLabel(imageName: "star.fill", label: "Sample Award", statisticAmount: 0)
							.padding(.trailing)
					}
				}
				Section(header: Text("Attempted Acheivements")) {
					ForEach(0..<3, id: \.self) {_ in
						StatisticsLabel(imageName: "star.leadinghalf.filled", label: "Sample Award", statisticAmount: 0)
							.padding(.trailing)
					}
				}
				Section(header: Text("Unfinished Acheivements")) {
					ForEach(0..<6, id: \.self) {_ in
						StatisticsLabel(imageName: "star", label: "Sample Award", statisticAmount: 0)
							.padding(.trailing)
					}
				}
			}
			.navigationTitle("Achievements")
		}
	}
}

struct AchievementsView_Previews: PreviewProvider {
	static var previews: some View {
		let vm = GlobalViewModel()
		AchievementsView(vm: vm)
	}
}
