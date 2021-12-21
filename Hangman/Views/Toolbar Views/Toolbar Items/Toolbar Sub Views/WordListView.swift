//
//  WordListView.swift
//  Hangman
//
//  Created by Alessia on 18/12/2021.
//

import SwiftUI

struct WordListView: View {
	@ObservedObject var appData: AppData
	
	var body: some View {
		VStack{
			List {
				ForEach(allLists) { list in
					ListLabel(imageName: list.icon, label: list.name)
				}
			}
			Button {
				appData.showingSettings.toggle()
				openShop()
			} label: {
				ButtonView(buttonLabel: "Open Item Store")
			}
		}
	}
	func openShop() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			appData.showingShop.toggle()
		}
	}
}

//struct WordListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordListView()
//    }
//}
