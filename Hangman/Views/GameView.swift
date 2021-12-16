//
//  GameView.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct GameView: View {
	@ObservedObject var vm: LettersModel
	
	@State private var showingAlert = false
	@State private var lives = ["a","a","a","a","a","a","a","a"]
	
	@Binding var debugActive: Bool
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				ForEach(vm.gameLetters, id: \.self) { letter in
					
					if vm.correctLetters.contains(letter) {
						Text(String(letter))
							.font(.system(size: 35, weight: .medium))
					} else {
						RoundedRectangle(cornerRadius: 10)
							.frame(width: 25, height: 4)
							.offset(y: 12)
					}
					
					
					
				}
				.frame(width: 30, height: 40)
			}
			
			HStack{
				ForEach(lives, id: \.self) { life in
					Image(systemName: "heart.fill")
						.foregroundColor(.red)
						.padding(.top)
				}
			}
						.frame(height: 60)
			

#if DEBUG
			if debugActive == true {
				DebugView(vm: vm)
		}
#endif
			Spacer()
			LettersView(vm: vm, lives: $lives)
			
			Spacer()
			
			Button {
				print("new game button pressed")
				showingAlert = true
			} label: {
				ButtonView(buttonLabel: "New Game", positionBottom: true)
			}
			.alert("Are You Sure", isPresented: $showingAlert) {
				Button("No", role: .cancel) { print("new game cancelled") }
				Button("Yes") {
					vm.gameLetters = LettersModel.getLetters()
					print("new game started")
					vm.usedLetters.removeAll()
					vm.correctLetters.removeAll()
					vm.incorrectLetters.removeAll()
					lives = ["a","a","a","a","a","a","a","a"]
				}
			}
		}
	}
}

//struct GameView_Previews: PreviewProvider {
//	static var previews: some View {
//		GameView(vm: vm, debugActive: .constant(false))
//	}
//}


