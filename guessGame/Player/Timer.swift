//
//  Timer.swift
//  guessGame
//
//  Created by Даниил Фомин on 29/04/2024.
//

import SwiftUI

struct TimerView: View {
    @State var roundTime: Int
    // Initial time remaining in seconds
    @State private var timerIsRunning = false // State to track if the timer is running
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Timer to update the countdown every second
    var onFinished: () -> Void
    
    var body: some View {
        VStack {
            Text("remaining: ").font(.title)
            Text("\(roundTime)")
                .font(.title)
            
            Button(action: {
                // Start or stop the timer based on its current state
                if timerIsRunning {
                    timer.upstream.connect().cancel()
                } else {
                    self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                }
                timerIsRunning.toggle()
            }) {
                Text(timerIsRunning ? "Pause" : "Resume")
            }.padding(20)
            
        }
        .onReceive(timer) { _ in
            if roundTime > 0 {
                roundTime -= 1
            } else {
                onFinished()
            }
        }
        .onAppear {
            // Start the timer when the view appears
            self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            timerIsRunning = true
        }
    }
}

#Preview {
    var exampleTime = 120
    func finished() {}
    return TimerView(roundTime: exampleTime, onFinished: finished)
}
