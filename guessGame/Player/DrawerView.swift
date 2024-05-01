//
//  DrawerView.swift
//  guessGame
//
//  Created by Даниил Фомин on 28/04/2024.
//

import SwiftUI

struct DrawerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.players) { player in
                PlayerRow(player: player, onDelete: {
                    if let index = viewModel.players.firstIndex(where: { $0.id == player.id }) {
                        viewModel.deletePlayer(at: index)
                    }
                })
            }
            
            TextField("Enter name", text: $viewModel.newPlayerName)
            HStack{
                Spacer()
                Button("Add Player") {
                    viewModel.addPlayer()
                }
                .disabled(viewModel.newPlayerName.isEmpty)
                Spacer()
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}
