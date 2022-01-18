//
//  ContentView.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI

struct ContentView: View {
	@StateObject var appData = AppData()
	@StateObject var vm = GlobalViewModel()
	
	@AppStorage("SelectedAppearance") var selectedAppearance = 0
	
	var body: some View {
		PlatformView(appData: appData, vm: vm)
			.onAppear(perform: {
				vm.hexToColor()
			})
			.tint(vm.color)
			.preferredColorScheme(selectedAppearance == 0 ? nil : vm.colorScheme())
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environmentObject(AppData()).environmentObject(GlobalViewModel())
	}
}
