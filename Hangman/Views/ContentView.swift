//
//  ContentView.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI

struct ContentView: View {
	@StateObject var vm = GameLetters()
	@State private var gameActive = false
	@State var debugActive = false
	
	var body: some View {
		PlatformView(vm: vm, gameActive: $gameActive, debugActive: $debugActive)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct PlatformView: View {
	@ObservedObject var vm = GameLetters()
	
	@Binding var gameActive: Bool
	@Binding var debugActive: Bool
	
	var body: some View {
		VStack {
			if gameActive == true {
#if os(iOS)
				//				Refactor this
				NavigationView {
					GameView(vm: vm, debugActive: $debugActive)
						.toolbar {
							ToolbarItemGroup(placement: .automatic) {
								Button{
									debugActive.toggle()
								} label: {
									Image(systemName: "gearshape")
								}
							}
						}
				}
#else
				GameView(vm: vm, debugActive: $debugActive)
#endif
			} else {
				Button {
					gameActive = true
				} label: {
					ButtonView(buttonLabel: "Start Game", positionBottom: false)
				}
			}
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
				Button{
					debugActive.toggle()
				} label: {
					Image(systemName: "gearshape")
				}
				Button{
					
				} label: {
					Image(systemName: "list.bullet.rectangle")
				}
			}
		}
#endif
	}
}
