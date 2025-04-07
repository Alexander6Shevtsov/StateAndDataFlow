//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 03.04.2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var userManager: UserManager // достаем save
    
    var body: some View {
        Group { // помещаем в контейнер
            if userManager.user.isLoggedIn { // отображение стартового экрана
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userManager) // и обратно кладем в окружение
    }
}

#Preview {
    RootView()
        .environmentObject(UserManager())
}
