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
		List {
			ForEach(allLists) { list in
				ListLabel(imageName: list.icon, label: list.name)
			}
		}
	}
}

//struct WordListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordListView()
//    }
//}
