//
//  ToolbarMainView.swift
//  Hangman (iOS)
//
//  Created by Alessia on 17/12/2021.
//

import SwiftUI

struct ToolbarMainView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	@State var showingSettings : Bool = false
	@State var showingStatistics : Bool = false
	
	var body: some View {
		
		Button{
			showingStatistics.toggle()
		} label: {
			Image(systemName: "list.bullet.rectangle")
		}
#if os(iOS)
		.sheet(isPresented: $showingStatistics) {
			StatisticsView(stats: stats)
		}
#else
		.popover(isPresented: $showingStatistics) {
			StatisticsView(stats: stats)
		}
#endif
		
		Button {
			showingSettings.toggle()
		} label: {
			Image(systemName: "gearshape")
		}
#if os(iOS)
		.sheet(isPresented: $showingSettings) {
			SettingsView(appData: appData, stats: stats)
		}
#else
		.popover(isPresented: $showingSettings) {
			SettingsView(appData: appData, stats: stats)
		}
#endif
	}
}

//struct ToolbarShopView

//struct ToolbarView_Previews: PreviewProvider {
//    static var previews: some View {
//		ToolbarView(showingStatistics: $showingStatistics, showingSettings: Binding<Bool>)
//    }
//}
