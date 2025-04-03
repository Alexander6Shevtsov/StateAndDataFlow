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
    
    var body: some View {
        VStack {
            Text(timer.counter.formatted()) // приводим к стринг
                .font(.largeTitle) // шрифт
                .padding(.top, 100) // отступ сверху
            
            Spacer() // поднимаем вверх
            
            ButtonView(timer: timer) // Binding передаем через $
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
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
