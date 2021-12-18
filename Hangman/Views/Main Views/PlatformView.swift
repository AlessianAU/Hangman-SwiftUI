//
//  PlatformView.swift
//  Hangman
//
//  Created by Alessia on 17/12/2021.
//

import SwiftUI

struct PlatformView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	var body: some View {
		VStack {
			
#if os(iOS)
			NavigationView {
				GameView(appData: appData, stats: stats)
					.toolbar {
						ToolbarItemGroup(placement: .navigationBarTrailing) {
							ToolbarView(appData: appData, stats: stats)
						}
					}
			}
			
			.navigationViewStyle(.stack)
#else
			GameView(appData: appData, stats: stats)
#endif
		}
		
		
#if os(macOS)
		.frame(width: 450, height: 600)
		.buttonStyle(.plain)
		.onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
			for window in NSApplication.shared.windows {
				window.standardWindowButton(.zoomButton)?.isEnabled = false
			}
		})
		.toolbar {
			ToolbarItemGroup(placement: .automatic) {
				ToolbarView(appData: appData, stats: stats)
			}
		}
#endif
	}
}

//struct PlatformView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlatformView()
//    }
//}
