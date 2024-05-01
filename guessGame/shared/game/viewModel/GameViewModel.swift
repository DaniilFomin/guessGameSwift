//
//  GameViewModel.swift
//  guessGame
//
//  Created by Даниил Фомин on 30/04/2024.
//

import Foundation
import CoreData


// ViewModel
class GameViewModel: ObservableObject {
    var game: Game
    @Published var currentTurnWord: Int = 0
    @Published var currentRound: Int = 0
    @Published var isFinished: Bool = false
    @Published var isWaitingAproval: Bool = true
    @Published var gameData: GameData?
    
    init(players: [Player], words: [CDWord]){
        self.game = Game(players: players, words: words)
    }
    
    func startGame() {
        self.game.nextTurn(turnStats: nil)
        self.gameData = GameData(currentWord: self.game.currentWord, currentHost: self.game.currentHost, currentRound: self.currentRound)
    }
    
    func markAsAnswered(playerName: String) {
        let stats: GameStats = GameStats(host: game.currentHost.getName(), player: playerName, word: game.currentWord.word, skipped: false)
        self.nextTurn(stats: stats)
    }
    
    func markAsSkipped() {
        let stats: GameStats = GameStats(host: game.currentHost.getName(), player: " ", word: game.currentWord.word, skipped: true)
        self.nextTurn(stats: stats)
    }
    
    func nextTurn(stats: GameStats) {
        if (self.currentTurnWord == 10) {
            self.currentTurnWord = 0
            nextRound()
        }
        
        if(!isFinished) {
            self.game.nextTurn(turnStats: stats)
            self.currentTurnWord += 1
        }
        self.gameData = GameData(currentWord: self.game.currentWord, currentHost: self.game.currentHost, currentRound: self.currentRound)
    }
    
    func nextRound() {
        if(self.game.nextRound()) {
            self.currentRound += 1
            self.isWaitingAproval = true
        } else {
            self.isFinished = true
        }
        
    }
    
    
}

struct GameData {
    var currentWord: CDWord
    var currentHost: Player
    var currentRound: Int
}
