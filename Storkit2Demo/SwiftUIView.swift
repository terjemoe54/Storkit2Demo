//
//  SwiftUIView.swift
//  Storkit2Demo
//
//  Created by Terje Moe on 03/01/2026.
//

import SwiftUI
import StoreKit
import Combine

struct SwiftUIView: View {
    @State var vm = Store()
    var body: some View {
        VStack {
          List(Array(vm.purchasedSubscriptions), id: \.self){
                Text("Hi")
                Text($0)
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
