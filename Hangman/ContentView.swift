//
//  ContentView.swift
//  Hangman
//
//  Created by Alessia on 5/12/21.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			Spacer()
			HStack {
				ForEach(0..<3) {_ in
					RoundedRectangle(cornerRadius: 10)
						.frame(width: 40, height: 5)
						.opacity(0.8)
				}
			}
			Spacer()
			LettersView()
			
			Spacer()
			NewWordButton()
		}
		.onAppear {
			let words = WordList.wordList
			let randomWord : String! = words.randomElement()
			let letters = Array(randomWord)
			print(randomWord ?? String())
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct NewWordButton: View {
	@State private var showingAlert = false
	let screen = UIScreen.main.bounds
	var body: some View {
		Button {
			print("new game button pressed")
			showingAlert = true
		} label: {
			ZStack{
				RoundedRectangle(cornerRadius: 15)
				Text("New Word")
					.font(.system(size: 25, weight: .medium))
					.foregroundColor(.white)
			}
			.frame(width: screen.width - 100, height: 60)
			.padding()
		}
		.alert("Are You Sure", isPresented: $showingAlert) {
			Button("Yes", role: .cancel) { print("new game started") }
			Button("No", role: .destructive) { print("new game cancelled") }
		}
	}
}

struct LettersView: View {
	let allLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
	let columns = [
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem(),
		GridItem()
	]
	var body: some View {
		VStack{
			LazyVGrid(columns: columns){
				ForEach(allLetters, id: \.self) { letter in
					Button {
						print("\(letter) button was pressed")
					} label: {
						ZStack{
							RoundedRectangle(cornerRadius: 10)
								.frame(width: 40, height: 40)
							Text(letter)
								.foregroundColor(.white)
								.font(.system(size: 25, weight: .medium))
						}
						.padding(6)
						
					}
				}
			}
		} .padding(.horizontal, 30)
	}
}
