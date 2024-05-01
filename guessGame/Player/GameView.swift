//
//  GameView.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var router: Router
    @ObservedObject var game: GameViewModel
    @State var titleName: String = ""
    var time: Int
    func resume() {
        game.isWaitingAproval = false
    }
    
    var body: some View {
        if(game.isWaitingAproval || game.isFinished) {
            
                
                if(!game.isFinished){
                    VStack {
                        Text("Host: ")
                            .foregroundColor(Color.orange)
                            .padding(EdgeInsets(top: 30, leading: 0, bottom: 20, trailing: 0))
                            .font(.system(size: 30))
                        Text(self.game.game.currentHost.getName())
                        Spacer()
                        
                        Button("Ready") {
                            resume()
                            if(game.currentRound == 0) {
                                game.startGame()
                            }
                            
                        }
                        Spacer()
                    }.navigationBarBackButtonHidden(true)
                }
                else {
                    NavigationLink("See Stats", destination: StatsView(stats: game.game.getStats())).onTapGesture {
                        print($router.path)
                    }.navigationBarBackButtonHidden(true)
                    
                }
            }
         else {
            VStack {
                Text(titleName)
                TimerView(roundTime: (game.isWaitingAproval) ? 0 :  time, onFinished: game.nextRound)
                Spacer()
                WordCard(word: self.game.gameData?.currentWord ?? CDWord())
                Spacer()
                PlayerSelectionView(players: game.game.players,
                                    onApprove: game.markAsAnswered(playerName:),
                                    onSkip: game.markAsSkipped
                )
            }.navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    var players = PlayerViewModel().players
    var words = WordsViewModel().words
    var time = SettingsViewModel().settings.getRoundTime() * 60
    var game = GameViewModel(players: players, words: words)
    game.isFinished = false
    return GameView(game: game, time: time).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).environmentObject(Router())
}
