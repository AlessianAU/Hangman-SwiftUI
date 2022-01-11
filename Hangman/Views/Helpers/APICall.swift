//
//  APICall.swift
//  Hangman
//
//  Created by Alessia on 11/1/2022.
//

import Foundation
import Alamofire

struct APICall {
	static func fetchWordDef(word_id: String? = "Capture") -> DataRequest {
		
		let language = "en-gb"
		
		let app_id = Bundle.main.object(forInfoDictionaryKey: "API_ID")
		let app_key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
		//You need to add your own API key & ID for this
		
		let headers:HTTPHeaders = [
			"app_id": "\(app_id ?? "")",
			"app_key": "\(app_key ?? "")"
		]
		
		let request = AF.request("https://od-api.oxforddictionaries.com/api/v2/entries/" + "\(language)" + "/"  + "\(word_id?.lowercased() ?? "Capture")", headers: headers)
		
		request.responseDecodable(of: DictionaryWord.self) { data in
			guard let word = data.value else {
				print(data)
				return
			}
			print(word.id)
		}
		return request
	}
}
