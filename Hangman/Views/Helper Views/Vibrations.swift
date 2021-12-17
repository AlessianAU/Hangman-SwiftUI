//
//  Vibrations.swift
//  Hangman (iOS)
//
//  Created by Alessia on 17/12/2021.
//

import Foundation
import SwiftUI


struct Vibrations {
	
	static func lightVibration() {
#if os(iOS)
		let impact = UIImpactFeedbackGenerator(style: .light)
		impact.impactOccurred()
#endif
	}
	
	static func heavyVibration() {
#if os(iOS)
		let impact = UIImpactFeedbackGenerator(style: .heavy)
		impact.impactOccurred()
#endif
	}
	
	static func rappidVibration() {
#if os(iOS)
		for _ in 0..<3 {
			let impact = UIImpactFeedbackGenerator(style: .heavy)
			impact.impactOccurred()
		}
#endif
	}
}

