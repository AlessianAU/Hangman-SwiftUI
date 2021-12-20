//
//  ToolbarSubView.swift
//  Hangman
//
//  Created by Alessia on 20/12/2021.
//

import SwiftUI

struct ToolbarSubView: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
	@State var showingShop : Bool = false
	
    var body: some View {
		Button{
			showingShop.toggle()
		} label: {
			Image(systemName: "bag")
		}
#if os(iOS)
		.sheet(isPresented: $showingShop) {
			ShopView()
		}
#else
		.popover(isPresented: $showingShop) {
			ShopView()
		}
#endif
    }
}

//struct ToolbarSubView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToolbarSubView()
//    }
//}
