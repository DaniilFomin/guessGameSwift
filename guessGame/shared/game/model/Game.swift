//
//  Game.swift
//  guessGame
//
//  Created by Даниил Фомин on 30/04/2024.
//

import Foundation

class Game {
    private var players_: [Player]
    private var currentHost_: Player?
    private var currentWords_: [CDWord]? = []
    private var usedWords_: [CDWord]? = []
    private var currentRound_: Int = 0
    private var stats: [GameStats] = []

    
    var players: [Player] {
        get {self.players_.filter({$0.id != currentHost.id})}
        set {self.players_ = newValue}
    }
    
    var currentHost: Player {
        get {currentHost_ ?? self.players_[self.currentRound_]}
        set {currentHost_ = newValue}
    }
    
    var currentWords: [CDWord] {
        get {self.currentWords_ ?? []}
        set {self.currentWords_ = newValue}
    }
    
    var currentWord: CDWord {
        get {(self.usedWords_?.last.unsafelyUnwrapped)!}
    }
    
    
    func nextTurn(turnStats: GameStats?) {
        if(turnStats != nil) {
            self.stats.append(turnStats!)
        }
        
        let newWord = currentWords_?.remove(at: 1)
        usedWords_?.append(newWord.unsafelyUnwrapped)
    }
    
    func nextRound() -> Bool {
        if (currentRound_ == players.count) {
            return false
        }
        self.currentRound_ += 1
        self.currentHost = self.players_[self.currentRound_]
        self.nextTurn(turnStats: nil)
        
        return true
    }
    
    func getStats() -> [GameStats] {
        return self.stats
    }
    
    
    init(players: [Player] = [], words: [CDWord]) {
        self.players_ = players
        self.currentWords = words
        self.currentHost = self.players_[self.currentRound_]
        
    }
    
}
