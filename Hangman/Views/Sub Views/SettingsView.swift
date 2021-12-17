//
//  SettingsView.swift
//  Hangman
//
//  Created by Alessia on 16/12/2021.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var appData: AppData
	
	var body: some View {
		NavigationView {
			List {
				Section {
					
					NavigationLink {
						Text("Words")
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
				ListLabel(imageColor: .red,imageName: "trash", label: "Reset Data")
					.foregroundColor(.red)
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

