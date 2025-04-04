//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 03.04.2025.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager // достаем save
    
    @State private var name = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center) // текст по центру
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
                
            }
        }
    }
    
    private func login() {
        if !name.isEmpty { // если свойство не пустое
            userManager.name = name // передаем значение
            userManager.isLoggedIn.toggle() // и меняем свойство на противополож
        } 
    }
}

#Preview {
    LoginView()
}
