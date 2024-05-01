//
//  PlayerGrid.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import SwiftUI

import SwiftUI

struct PlayerGrid: Identifiable {
    let id = UUID()
    let name: String
}

struct PlayerSelectionView: View {
    var players: [Player]
    var onApprove: (String) -> Void
    var onSkip:() -> Void
    
    var body: some View {
        HStack{
            Button("Skip"){
                onSkip()
            }
        }
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(players) { player in
                Button(action: {
                    onApprove(player.getName())
                }) {
                    Text(player.getName())
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}

#Preview {
    var players = PlayerViewModel().players
    func approve(name: String){}
    func skip(){}
    return PlayerSelectionView(players: players, onApprove: approve, onSkip: skip)
}
