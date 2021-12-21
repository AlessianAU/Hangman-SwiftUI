//
//  ShopItems.swift
//  Hangman
//
//  Created by Alessia on 21/12/2021.
//

import SwiftUI

struct ShopItem: Identifiable {
	var id = UUID()
	var name: String
	var description: String
	var price: Int
	var puchased: Bool = false
}
