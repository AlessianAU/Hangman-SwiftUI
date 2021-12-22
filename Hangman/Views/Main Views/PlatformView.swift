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
				GameOverView(appData: appData, stats: stats)
					.toolbar {
						
						ToolbarItemGroup(placement: .navigationBarTrailing) {
							if appData.gameOver == 0 {
								ToolbarMainView(appData: appData, stats: stats)
							}
						}
						ToolbarItemGroup(placement: .navigationBarLeading) {
							if appData.gameOver == 0 {
								ToolbarSubView(appData: appData, stats: stats)
							}
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
				ToolbarMainView(appData: appData, stats: stats)
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
