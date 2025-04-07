//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 04.04.2025.
//

import SwiftUI

final class StorageManager {
    
    static let shared = StorageManager()
    
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let userData else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: userData)
        guard let user else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isLoggedIn = false
        userManager.user.name = ""
        userData = nil
    }
}
