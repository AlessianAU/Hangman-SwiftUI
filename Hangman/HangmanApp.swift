//
//  HangmanApp.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI

@main
struct HangmanApp: App {
	var body: some Scene {
#if os(macOS)
		WindowGroup {
			ContentView()
		}
		.windowToolbarStyle(.unified)
		.windowStyle(HiddenTitleBarWindowStyle())
#else
		WindowGroup {
			ContentView()
		}
#endif
	}
}
