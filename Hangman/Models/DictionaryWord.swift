//
//  Dictionary.swift
//  Hangman
//
//  Created by Alessia on 11/1/2022.
//

import Foundation

//struct Films: Decodable {
//  let count: Int
//  let all: [Film]
//
//  enum CodingKeys: String, CodingKey {
//	case count
//	case all = "results"
//  }
//}
//
//
//struct Film: Decodable {
//  let id: Int
//  let title: String
//  let openingCrawl: String
//  let director: String
//  let producer: String
//  let releaseDate: String
//  let starships: [String]
//
//  enum CodingKeys: String, CodingKey {
//	case id = "episode_id"
//	case title
//	case openingCrawl = "opening_crawl"
//	case director
//	case producer
//	case releaseDate = "release_date"
//	case starships
//  }
//}

struct DictionaryWord: Decodable {
	let id: String
	let results: Results
}

struct Results: Decodable {
	let lexicalEntries: LexicalEntries
}

struct LexicalEntries: Decodable {
//	let entries: Entries
	let lexicalCategory: LexicalCategory
}

struct Entries: Decodable {
	let senses: Senses
}

struct LexicalCategory: Decodable {
	let text: String
}

struct Senses: Decodable {
	let definitions: String
//	let examples: (Examples)
//	let synonyms: Synonyms
}

struct Examples: Decodable {
	let text: String
}

struct Synonyms: Decodable {
	let text: String
}
