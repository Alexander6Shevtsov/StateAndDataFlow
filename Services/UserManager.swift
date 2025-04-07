//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 03.04.2025.
//

import Foundation
// подписываем чтоб обновлять данные
final class UserManager: ObservableObject { // чтоб юзать паблишер
    
    @Published var user = User() // кода нужно отслеживать свойство
    
    var nameIsValid: Bool { // геттер
        user.name.count >= 3 // валидация числа в имени
    }
    
    init(user: User = User()) {
        self.user = user
    }
}
