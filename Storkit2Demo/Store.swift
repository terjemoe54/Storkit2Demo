//
//  StoreManager.swift
//  Storkit2Demo
//
//  Created by Terje Moe on 03/01/2026.
//
import SwiftUI

@Observable
class Store {
    var isShowingSubscription = false
    var purchasedSubscriptions: Set<String> = []
}
