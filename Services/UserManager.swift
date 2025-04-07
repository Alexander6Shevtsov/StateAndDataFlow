//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 03.04.2025.
//

import Foundation
// подписываем чтоб обновлять данные
final class UserManager: ObservableObject {
    
    @Published var user = User()
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init(user: User = User()) {
        self.user = user
    }
}
