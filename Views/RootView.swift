//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 03.04.2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group { // помещаем в контейнер
            if userManager.user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userManager) // и вызываем модификатор save
    }
}

#Preview {
    RootView()
        .environmentObject(UserManager())
}
