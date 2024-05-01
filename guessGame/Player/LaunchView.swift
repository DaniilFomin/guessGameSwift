//
//  LaunchScreen.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var router: Router
    @ObservedObject var settings = SettingsViewModel()
    @ObservedObject var players = PlayerViewModel()
    @ObservedObject var words = WordsViewModel()

    var gameViewModel: GameViewModel {
        GameViewModel(players: self.players.players,words: self.words.words)
    }
    
    
    var body: some View {
        NavigationStack(path: $router.path){
            VStack {
                
                HStack {
                    NavigationLink(destination: SettingsView(settings: settings)){
                        Text("Settings").padding().font(.system(size: 30))                    }
                    Spacer()
                }.navigationBarTitleDisplayMode(.large).navigationTitle("Main Menu")
                Spacer()
                NavigationLink("Play", value: router.routes[1])
                    .font(.system(size: 40)).padding()
                Spacer()
                
                Button("Players") {
                    withAnimation {
                        players.isDrawerOpen.toggle()
                    }
                }
                .frame(width: 100, height: 20)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .overlay(
                DrawerView(viewModel: players)
                    .frame(width: UIScreen.main.bounds.width, height: 600)
                    .offset(y: players.isDrawerOpen ? UIScreen.main.bounds.height - 900 : UIScreen.main.bounds.height)
            ).navigationDestination(for: String.self){ pathName in
                if pathName == router.routes[1] {
                    GameView(game: gameViewModel, time: settings.selectedTime * 60)
                }
            }
        }
    }
}

#Preview {
    LaunchView().environmentObject(Router())
}
