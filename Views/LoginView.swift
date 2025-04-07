//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 03.04.2025.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var userManager: UserManager // достаем save
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            UserNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid
            )
            Button(action: registerUser) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(!userManager.nameIsValid)
        }
        .padding()
    }
    
    private func registerUser() {
        userManager.user.isLoggedIn.toggle()
        storageManager.save(user: userManager.user)
    }
}

struct UserNameTF: View {
    
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center) // текст по центру
            HStack {
                Spacer()
                Text(name.count.formatted())
                    .font(.caption)
                    .foregroundStyle(nameIsValid ? .green : .red)
                    .padding(.vertical)
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(UserManager())
}
