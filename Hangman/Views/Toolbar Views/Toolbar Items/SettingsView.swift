//
//  SettingsView.swift
//  Hangman
//
//  Created by Alessia on 16/12/2021.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var vm: GlobalViewModel
	@State private var showingSheet = false
	
	@AppStorage("DebugActive") var debugActive = false
	@AppStorage("HapticFeedback") var hapticFeedback = false
	
	var body: some View {
		NavigationView {
			List {
				Section {
					
					NavigationLink {
						WordListView(appData: appData, vm: vm)
					} label: {
						ListLabel(imageName: "book", label: "Word Packs")
					}
					
					NavigationLink {
						AppearanceView(appData: appData, vm: vm)
					} label: {
						ListLabel(imageName: "paintpalette", label: "Appearance")
					}
					
#if os(iOS)
					if UIDevice.current.userInterfaceIdiom == .phone {
						Toggle(isOn: $hapticFeedback) {
							ListLabel(imageName: "iphone.radiowaves.left.and.right", label: "Haptic Feedback")
						}
					}
#endif
				}
#if DEBUG
				Section {
					Toggle(isOn: $debugActive) {
						ListLabel(imageName: "ladybug", label: "Debug Mode")
					}
						if debugActive {
							NavigationLink {
								DebugOptions(appData: appData, vm: vm)
							} label: {
								ListLabel(imageName: "ant", label: "Debug Options")
						}
					}
				}
#endif
				Section {
					Button {
						showingSheet = true
					} label: {
						ListLabel(imageName: "trash", label: "Reset All Data...", destructive: true)
							.foregroundColor(.red)
					}
					.sheet(isPresented: $showingSheet) {
						ResetDataView(appData: appData, vm: vm, showingSheet: $showingSheet)
					}
				}
				
				
			}
#if os(iOS)
			.navigationBarTitle("Settings")
#else
			.listStyle(.inset)
#endif
		}
	}
}

//struct SettingsView_Previews: PreviewProvider {
//	static var previews: some View {
//		SettingsView(debugActive)
//	}
//}

