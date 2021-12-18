//
//  ContentView.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI

struct ContentView: View {
	@StateObject var appData = AppData()
	@StateObject var stats = Statistics()
	
	var body: some View {
		PlatformView(appData: appData, stats: stats)
	}
}

//struct ContentView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContentView()
//	}
//}
