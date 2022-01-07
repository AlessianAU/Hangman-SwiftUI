//
//  HintView.swift
//  Hangman
//
//  Created by Alessia on 25/12/2021.
//

import SwiftUI

struct HintView: View {
	@ObservedObject var stats: Statistics
	var body: some View {
		List{
			Button {
				stats.purchase(amount: 15, hintAmount: 1)
			} label: {
				StatisticsLabel(imageName: "dollarsign.circle", label: "Hint X1", statisticAmount: 15)
			}
			
			Button {
				stats.purchase(amount: 40, hintAmount: 3)
			} label: {
				StatisticsLabel(imageName: "dollarsign.circle", label: "Hint X3", statisticAmount: 40)
			}
			
			Button {
				stats.purchase(amount: 75, hintAmount: 6)
			} label: {
				StatisticsLabel(imageName: "dollarsign.circle", label: "Hint X6", statisticAmount: 75)
			}
		}
	}
}

//struct HintView_Previews: PreviewProvider {
//	static var previews: some View {
//		HintView()
//	}
//}
