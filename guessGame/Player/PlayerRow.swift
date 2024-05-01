//
//  PlayerRow.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import SwiftUI

// Player Row View
struct PlayerRow: View {
    let player: Player
    var onDelete: () -> Void
    
    var body: some View {
        HStack {
            Text(player.getName())
                .opacity(0.7)
                .foregroundColor(.red)
                .padding()
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}


