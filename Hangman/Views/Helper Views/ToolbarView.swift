//
//  ToolbarView.swift
//  Hangman (iOS)
//
//  Created by Alessia on 17/12/2021.
//

import SwiftUI

struct ToolbarView: View {
	@ObservedObject var appData: AppData
	
	var body: some View {
		
		Button{
			appData.showingStatistics.toggle()
		} label: {
			Image(systemName: "list.bullet.rectangle")
		}
#if os(iOS)
		.sheet(isPresented: $appData.showingStatistics) {
			StatisticsView()
		}
#else
		.popover(isPresented: $appData.showingStatistics) {
			StatisticsView()
		}
#endif
		
		Button {
			appData.showingSettings.toggle()
		} label: {
			Image(systemName: "gearshape")
		}
#if os(iOS)
		.sheet(isPresented: $appData.showingSettings) {
			SettingsView(appData: appData)
		}
#else
		.popover(isPresented: $appData.showingSettings) {
			SettingsView(appData: appData)
		}
#endif
	}
}

//struct ToolbarView_Previews: PreviewProvider {
//    static var previews: some View {
//		ToolbarView(showingStatistics: $showingStatistics, showingSettings: Binding<Bool>)
//    }
//}
