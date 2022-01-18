//
//  APICall.swift
//  Hangman
//
//  Created by Alessia on 11/1/2022.
//

import Foundation
import Combine

class DefinitionViewModel: ObservableObject {
	
//	@Published var presenters: [DefinitionModelPresenter] = []
	
//	private var task: Cancellable? = nil
	
	let headers: Dictionary<String, Any>
	
	//		let language = "en-gb"
	
	let app_id = Bundle.main.object(forInfoDictionaryKey: "API_ID")
	let app_key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") 
	///You need to add your own API key & ID for this
	
	init() {
		headers = [
			"app_id": "\(app_id ?? "")",
			"app_key": "\(app_key ?? "")"
		]
		
		self.fetchData()
	}
	
	func fetchData(word_id: String? = "Capture")  {
//		self.task = AF.request("https://api.sampleapis.com/futurama/info", method: .get, headers: headers)
//			.publishDecodable(type: [DefinitionModel].self)
//			.sink(receiveCompletion: { (completion) in
//				switch completion {
//				case .finished: ()
//				case .failure(let error):
//					print(error.localizedDescription)
//				}
//			}, receiveValue: { [weak self ](response) in
//				switch response.result {
//				case .success(let model):
//					self?.presenters = model.map { DefinitionModelPresenter(with: $0) }
//				case .failure(let error):
//					print(error.localizedDescription)
//				}
//
//			})
		
		
		
	}
}

