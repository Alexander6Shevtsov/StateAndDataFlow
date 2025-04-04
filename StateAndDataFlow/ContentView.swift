//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 02.04.2025.
//

import SwiftUI

struct ContentView: View {
    // @StateObject чтоб получать обновления от ObservableObject
    @StateObject private var timer = TimeCounter() // иниц экземпляр классом
    @EnvironmentObject private var userManager: UserManager // доступ к save
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted()) // приводим к стринг
                .font(.largeTitle) // шрифт
                .padding(.top, 100) // отступ сверху
            
            Spacer() // поднимаем вверх
            
            ButtonView(timer: timer)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager()) // устраняем ошибку
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle) // значение берем из класса
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
