//
//  Settings.swift
//  guessGame
//
//  Created by Даниил Фомин on 28/04/2024.
//

import Foundation
class Settings {
    var roundTime: Int
    var difficulty: String
    var players: Int
    
    init(){
        roundTime  = 5
        difficulty = "Easy"
        players = 2
    }
    
    func getDifficulty() -> String {
        return self.difficulty
    }
    
    func setDifficulty(difficulty: String) {
        self.difficulty = difficulty
    }
    
    func getRoundTime() -> Int {
        return self.roundTime
    }
    
    func setRoundTime(time: Int) {
        self.roundTime = time
    }
}

