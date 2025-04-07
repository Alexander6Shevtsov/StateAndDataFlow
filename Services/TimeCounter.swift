//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Alexander Shevtsov on 02.04.2025.
//

import Foundation
import Observation

@Observable final class TimeCounter {
    
    var counter = 3 // уведомляем что значение поменялось
    var buttonTitle = "Start"
    
    private var timer: Timer?
    
    func startTimer() {
        if counter > 0 { // если значение больше 0 то запускаем
            timer = Timer.scheduledTimer(
                timeInterval: 1, // интервал в секундах
                target: self, // цель себя
                selector: #selector(updateCounter), // действие
                userInfo: nil, // опускаем
                repeats: true // повторение
            )
        }
        
        buttonDidTapped()
    }
    
    @objc private func updateCounter() { // #selector принимает только @objc
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset" // меняем кнопку по завершению таймера
        }
    }
    
    private func killTimer() {
        timer?.invalidate() // останавливаем
        timer = nil // выгружаем из памяти
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
    }
}
