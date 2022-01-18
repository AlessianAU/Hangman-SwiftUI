//
//  Dictionary.swift
//  Hangman
//
//  Created by Alessia on 11/1/2022.
//

import Foundation

//struct DefinitionModelPresenter: Identifiable {
//	let id = UUID()
//	let synopsis: String
//	let name: String
//
//	init(with model: DefinitionModel) {
//		self.synopsis = model.synopsis
//		self.name = model.creators.name
//	}
//}



struct DefinitionModel: Decodable {
	var synopsis: String
	var yearsAired: String
	var creators: [Creators]
	var id: Int
}

struct Creators: Decodable {
	var name: String
	var url: String
}





struct Movies: Decodable {
	var synopsis: String
}


struct DictionaryWord: Decodable{
	let id: String
	let results: Results
}

struct Results: Decodable {
	let lexicalEntries: LexicalEntries
}

struct LexicalEntries: Decodable {
	let id: String
	let language: String
	let entries: Entries
	let lexicalCategory: [LexicalCategory]
}

struct Entries: Decodable {
	let senses: Senses
}

struct LexicalCategory: Decodable {
	let id: String
	let text: String
}

struct Senses: Decodable {
	let definitions: String
	let examples: (Examples)
	let synonyms: Synonyms
}

struct Examples: Decodable {
	let text: String
}

struct Synonyms: Decodable {
	let text: String
}
