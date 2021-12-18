//
//  WordListModel.swift
//  Hangman
//
//  Created by Alessia on 18/12/2021.
//

import Foundation

struct WordListModel: Identifiable {
	var id = UUID()
	var name: String
	var icon: String
	var list: Array<String>
}
