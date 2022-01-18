//
//  DefinitionView.swift
//  Hangman
//
//  Created by Alessia on 11/1/2022.
//

import SwiftUI
import Alamofire

struct DefinitionView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var definition = DefinitionViewModel()
	
	
	var body: some View {
//		VStack{
//			ForEach(self.definition.presenters) { item in
//				Text(item.synopsis)
//			}
//		}
		
		
				ZStack {
					Color.black
						.ignoresSafeArea()
						.opacity(0.6)
					VStack(alignment: .leading) {
						Text(String(appData.gameLetters))
							.font(.system(size: 60, weight: .bold))
		
						Text("Noun")
							.font(.system(size: 30))
							.opacity(0.4)
		
						Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla diam sapien, pulvinar in auctor efficitur, accumsan ut velit. Nulla scelerisque eu est vitae consectetur.")
							.font(.system(size: 25))
							.padding(.top, 1)
		
						Text("Synonyms")
							.font(.system(size: 20))
							.opacity(0.8)
							.offset(y: 10)
							.padding(.top, 1)
						ScrollView(.horizontal ,showsIndicators: false) {
							HStack {
								ForEach(0..<10, id: \.self) {_ in
									Text("Synonym")
								}
								.font(.system(size: 20))
								.opacity(0.4)
							}
						}
					}
					.padding(30)
					.preferredColorScheme(.dark)
				}
//				.onAppear {
//					self.definitionData = APICall.fetchWordDef(word_id: String(appData.gameLetters))
//				}
	}
}

//struct DefinitionView_Previews: PreviewProvider {
//	static var previews: some View {
//		DefinitionView()
//	}
//}
