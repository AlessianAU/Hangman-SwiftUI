//
//  DebugView.swift
//  Hangman
//
//  Created by Alessia on 10/12/21.
//

import SwiftUI

struct DebugView: View {
	@ObservedObject var vm: LettersModel
	
	@State var safe = 0
	
	var body: some View {
		VStack{
			HStack {
				Text("Word")
				ForEach(vm.gameLetters, id: \.self) { letter in
					Text(String(letter))
				}
				Spacer()
			}

			HStack {
				Text("Correct")
				ForEach(vm.correctLetters, id: \.self) { letter in
					Text(String(letter))
				}
				Spacer()
			}

			HStack {
				Text("Incorrect")
				ForEach(vm.incorrectLetters, id: \.self) { letter in
					Text(String(letter))
				}
				Spacer()
			}
			
			HStack {
				Text("Functioning Words : \(safe)")
				Spacer()
				Button {
					safe += 1
				} label: {
					Image(systemName: "circle.fill")
				}

			}
		}.padding()
	}
}
