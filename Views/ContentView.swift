//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 02.04.2025.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var userManager: UserManager // доступ к save

    private let timer = TimeCounter()
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle) // шрифт
                .padding(.top, 100) // отступ сверху
            
            Spacer() // поднимаем вверх
            
            VStack {
         Spacer()
                
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                
                Spacer()
                
                ButtonView(title: "LogOut", color: .blue) {
                    storageManager.clear(userManager: userManager)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager()) // fix error
}

//struct ButtonView: View {
//    @ObservedObject var timer: TimeCounter
//    
//    var body: some View {
//        Button(action: timer.startTimer) {
//            Text(timer.buttonTitle) // значение берем из класса
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundStyle(.white)
//        }
//        .frame(width: 200, height: 60)
//        .background(Color.red)
//        .clipShape(.rect(cornerRadius: 20))
//        .overlay(
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(.black, lineWidth: 4)
//        )
//    }
//}
