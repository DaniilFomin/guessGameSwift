//
//  StatsView.swift
//  guessGame
//
//  Created by Даниил Фомин on 30/04/2024.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var router: Router
    var stats: [GameStats]
    var dict: Dictionary<String, [Array<GameStats>.Element]>{
        Dictionary(grouping: self.stats, by: { $0.host })
    }
    
    var body: some View {
        
        Button("Back to menu") {
            router.reset()
        }.padding()
            VStack{
                List{
                    ForEach(dict.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        Section(header: Text(key)){
                            ForEach(value) {state in
                                HStack{
                                    if (state.player != " ") {
                                        Text("Player: \(state.player)")
                                    }
                                    Text("Word: \(state.word)")
                                }
                            }
                        }
                    }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }


#Preview {
    var players = PlayerViewModel().players
    var example = GameStats(host: " ", player: " ", word: " ", skipped: false).example(players: players)
    return StatsView(stats: example).environmentObject(Router())
}
