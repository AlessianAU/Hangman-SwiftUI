//
//  Service.swift
//  Hangman
//
//  Created by Alessia on 13/1/2022.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
	func fetchChats() -> AnyPublisher<DataResponse<DefinitionModel, NetworkError>, Never>
}


class Service {
	static let shared: ServiceProtocol = Service()
	private init() { }
}

extension Service: ServiceProtocol {
	func fetchChats() -> AnyPublisher<DataResponse<DefinitionModel, NetworkError>, Never> {
		let url = URL(string: "Your_URL")!
		
		return AF.request(url,
						  method: .get)
			.validate()
			.publishDecodable(type: DefinitionModel.self)
			.map { response in
				response.mapError { error in
					let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
					return NetworkError(initialError: error, backendError: backendError)
				}
			}
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}
}
