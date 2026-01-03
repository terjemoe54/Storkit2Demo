//
//  ContentView.swift
//  Storkit2Demo
//
//  Created by Terje Moe on 02/01/2026.
//
import SwiftUI
import StoreKit
import Combine



struct ContentView: View {
    @State var vm = Store()
    var body: some View {
        VStack {
            Button("Subscriptions") {
                vm.isShowingSubscription.toggle()
            }
            List(Array(vm.purchasedSubscriptions), id: \.self){
                Text($0)
            }
        }
        .padding()
        .sheet(isPresented: $vm.isShowingSubscription) {
            SubscriptionStoreView(groupID: "CBCB8602") //LocalConfig
            // SubscriptionStoreView(groupID: "21876071") //AppConect
        }
        .onInAppPurchaseCompletion{ product, purchaseResult in
            guard case .success(let verificationResult) = purchaseResult,
                  case .success(_) = verificationResult else {
                // TODO: Handle error here
                return
            }
            vm.purchasedSubscriptions.insert(product.id)
            vm.isShowingSubscription.toggle()
        }
    }
}

#Preview {
    ContentView()
}
