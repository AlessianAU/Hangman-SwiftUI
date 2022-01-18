//
//  Errors.swift
//  Hangman
//
//  Created by Alessia on 13/1/2022.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
	var status: String
	var message: String
}
