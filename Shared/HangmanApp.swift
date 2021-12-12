//
//  HangmanApp.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI
import Foundation
#if os(macOS)
import AppKit


@main
struct HangmanApp: App {
	@NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
		.windowToolbarStyle(.unified)
		.windowStyle(HiddenTitleBarWindowStyle())
	}
}

class AppDelegate: NSObject, NSApplicationDelegate {
	func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
		return true
	}
}

#else

@main
struct HangmanApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
	}
}

#endif
