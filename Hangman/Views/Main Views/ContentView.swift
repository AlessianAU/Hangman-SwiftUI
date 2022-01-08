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
	
	@AppStorage("SelectedAppearance") var selectedAppearance = 0
	
	var body: some View {
		PlatformView(appData: appData, stats: stats)
			.onAppear(perform: {
				stats.hexToColor()
			})
			.tint(stats.color)
			.preferredColorScheme(selectedAppearance == 0 ? nil : stats.detectColorScheme())
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environmentObject(AppData()).environmentObject(Statistics())
	}
}
