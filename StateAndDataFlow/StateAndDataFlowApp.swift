//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 02.04.2025.
//

import SwiftUI

@main
struct StateAndDataFlow: App {
    @StateObject private var userManager = UserManager(
        user: StorageManager.shared.fetchUser()
    )
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(userManager)
        }
    }
}

