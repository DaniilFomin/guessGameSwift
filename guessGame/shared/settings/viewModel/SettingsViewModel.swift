//
//  SettingsViewModel.swift
//  guessGame
//
//  Created by Даниил Фомин on 28/04/2024.
//

import SwiftUI
import Foundation

// ViewModel
class SettingsViewModel: ObservableObject {
    @Published var settings: Settings = Settings()
    @Published var selectedTime: Int = 5
    @Published var selectetDifficulty: String = "Easy"
    @Published var avialibleTime: Array<Int> = Array(1 ... 100)
    @Published var avialibleDifficulty: Array<String> = ["Easy", "Medium", "Hard"]
    
    init(){
        settings = Settings()
    }
    
    func resetTime() {
        settings.setRoundTime(time: 5)
        selectedTime = 5
    }
    
    func resetDifficulty() {
        settings.setDifficulty(difficulty: "Easy")
        selectetDifficulty = "Easy"
    }
    
    func saveSettings() {
        settings.setRoundTime(time: selectedTime)
        settings.setDifficulty(difficulty: selectetDifficulty)
    }
}
