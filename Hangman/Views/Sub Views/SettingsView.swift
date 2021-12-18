//
//  SettingsView.swift
//  Hangman
//
//  Created by Alessia on 16/12/2021.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	@State private var showingAlert = false
	
	var body: some View {
		NavigationView {
			List {
				Section {
					
					NavigationLink {
						WordListView(appData: appData)
					} label: {
						ListLabel(imageName: "book", label: "Word Packages")
					}
					
					
					
#if os(iOS)
					if UIDevice.current.userInterfaceIdiom == .phone {
						Toggle(isOn: $appData.hapticFeedback) {
							ListLabel(imageName: "iphone.radiowaves.left.and.right", label: "Haptic Feedback")
						}
					}
#endif
				}
				Section {
					Toggle(isOn: $appData.debugActive) {
						ListLabel(imageName: "ladybug", label: "Debug Mode")
					}
				}
				
				Button {
					showingAlert = true
				} label: {
					ListLabel(imageColor: .red,imageName: "trash", label: "Reset Data")
										.foregroundColor(.red)
				}
				.alert("Are You Sure", isPresented: $showingAlert) {
					Button("Cancel", role: .cancel) {}
					Button("Reset", role: .destructive) {
						stats.pressed = 0
						stats.lossed = 0
						stats.won = 0
						stats.streaks = 0
						stats.played = 0
						print("Stats Reset")
					}
				}

				
			}
			#if os(iOS)
			.navigationBarTitle("Settings")
//			.navigationBarHidden(true)
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

