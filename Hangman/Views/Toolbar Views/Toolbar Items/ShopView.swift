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
				} label: {
					StatisticsLabel(imageName: "", label: "Spend 10", statisticAmount: 10)
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
