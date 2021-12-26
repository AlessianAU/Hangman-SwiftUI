//
//  ShopView.swift
//  Hangman
//
//  Created by Alessia on 20/12/2021.
//

import SwiftUI

struct ShopView: View {
	@ObservedObject var stats: Statistics
	@ObservedObject var appData: AppData
	
    var body: some View {
		NavigationView {
			List {
				Section {
				Button {
					stats.purchase(amount: 10)
				} label: {
					StatisticsLabel(imageName: "dollarsign.circle", label: "Spend 10", statisticAmount: 10)
				}

				}
				Section {
				NavigationLink {
					Text("")
				} label: {
					ListLabel(imageName: "book", label: "Word Packs")
				}
					NavigationLink() {
					HintView(stats: stats)
				} label: {
					ListLabel(imageName: "questionmark.circle", label: "Hints")
				}
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
