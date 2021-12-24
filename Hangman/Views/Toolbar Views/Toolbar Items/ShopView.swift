//
//  ShopView.swift
//  Hangman
//
//  Created by Alessia on 20/12/2021.
//

import SwiftUI

struct ShopView: View {
	@ObservedObject var stats: Statistics
	
    var body: some View {
		NavigationView {
			List {
				Button {
					stats.purchase(amount: 10)
					stats.increment(key: "Hints")
				} label: {
					StatisticsLabel(imageName: "dollarsign.circle", label: "Spend 10", statisticAmount: 10)
				}
				Button {
					stats.purchase(amount: 15)
				} label: {
					StatisticsLabel(imageName: "dollarsign.circle", label: "Hint X1", statisticAmount: 15)
				}
				NavigationLink {
					Text("")
				} label: {
					ListLabel(imageName: "book", label: "Word Packs")
				}
				NavigationLink {
					Text("")
				} label: {
					ListLabel(imageName: "questionmark.circle", label: "Hints")
				}


			}
				.navigationBarTitle("Item Store")
		}
    }
}

//struct ShopView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopView()
//    }
//}
