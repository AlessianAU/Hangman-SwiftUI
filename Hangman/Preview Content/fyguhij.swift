//
//  fyguhij.swift
//  Hangman
//
//  Created by Alessia on 8/12/21.
//

import SwiftUI

struct fyguhij: View {
	let l = ["a", "b", "c"]
	
	var body: some View {
		NavigationView {
			List {
				ForEach (l, id: \.self) {l in
					NavigationLink(destination: sv()) {
						Text(l)
					}.navigationBarTitle(Text("List")).disabled(l == "b")
				}
			}
		}
		.navigationViewStyle(DoubleColumnNavigationViewStyle())
//			.padding()
		
	}
}

struct fyguhij_Previews: PreviewProvider {
	static var previews: some View {
		fyguhij()
	}
}

struct sv: View {
	var body: some View {
		Text("Hello, World!")
	}
}
