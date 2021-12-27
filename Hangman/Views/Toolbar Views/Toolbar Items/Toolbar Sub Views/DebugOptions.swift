//
//  DebugOptions.swift
//  Hangman
//
//  Created by Alessia on 21/12/2021.
//

import SwiftUI

struct DebugOptions: View {
	@ObservedObject var appData: AppData
	@ObservedObject var stats: Statistics
	
    var body: some View {
			List {
				Button {
					var num = stats.defaults.integer(forKey: "CurrentMoney")
					num += 10
					stats.defaults.set(num, forKey: "CurrentMoney")
				} label: {
					ListLabel(imageName: "dollarsign.circle", label: "Give Money x10")
				}
				Button {
					var num = stats.defaults.integer(forKey: "CurrentMoney")
					num += 100
					stats.defaults.set(num, forKey: "CurrentMoney")
				} label: {
					ListLabel(imageName: "dollarsign.circle", label: "Give Money x100")
				}
				Button {
					var num = stats.defaults.integer(forKey: "CurrentMoney")
					num += 1000
					stats.defaults.set(num, forKey: "CurrentMoney")
				} label: {
					ListLabel(imageName: "dollarsign.circle", label: "Give Money x1000")
				}
		}
    }
}

//struct DebugOptions_Previews: PreviewProvider {
//    static var previews: some View {
//        DebugOptions()
//    }
//}
