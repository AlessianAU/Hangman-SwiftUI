//
//  ToolbarMainView.swift
//  Hangman (iOS)
//
//  Created by Alessia on 17/12/2021.
//

import SwiftUI

struct ToolbarMainView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var vm: GlobalViewModel
	
	var body: some View {
		
		Button{
			appData.showingStatistics.toggle()
		} label: {
			Image(systemName: "list.bullet.rectangle")
		}
#if os(iOS)
		.sheet(isPresented: $appData.showingStatistics) {
			StatisticsView(vm: vm)
		}
#else
		.popover(isPresented: $appData.showingStatistics) {
			StatisticsView(vm: vm)
		}
#endif
		
		Button {
			appData.showingSettings.toggle()
		} label: {
			Image(systemName: "gearshape")
		}
#if os(iOS)
		.sheet(isPresented: $appData.showingSettings) {
			SettingsView(appData: appData, vm: vm)
		}
#else
		.popover(isPresented: $appData.showingSettings) {
			SettingsView(appData: appData, vm: vm)
		}
#endif
	}
}

struct ToolbarSubView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var vm: GlobalViewModel
	
	var body: some View {
		Button{
			appData.showingShop.toggle()
		} label: {
			Image(systemName: "dollarsign.circle")
			Text(String(vm.defaults.integer(forKey: "CurrentMoney")))
				.offset(x: -5)
		}
#if os(iOS)
		.sheet(isPresented: $appData.showingShop) {
			ShopView(vm: vm, appData: appData)
		}
#else
		.popover(isPresented: $appData.showingShop) {
			ShopView(vm: vm, appData: appData)
		}
#endif
	}
}
