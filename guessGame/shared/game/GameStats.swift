//
//  GameStats.swift
//  guessGame
//
//  Created by Даниил Фомин on 30/04/2024.
//

import Foundation
import SwiftUI

struct GameStats : Identifiable, Hashable {
    var id =  UUID()
    var host: String
    var player: String
    var word: String
    var skipped: Bool
}

extension GameStats {
    func example(players: [Player]) -> [GameStats]{
        var stats:[GameStats] = []
        
        players.forEach { player in
            stats.append(GameStats(host: players[0].getName(), player: player.getName(), word: "sfalnjlfabljsbfja", skipped: false)
            )}
        
        players.forEach { player in
            stats.append(GameStats(host: players[0].getName(), player: " ", word: "sfaabljsbfja", skipped: true)
            )}
        
        return stats
        
    }
}

