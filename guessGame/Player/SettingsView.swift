//
//  SettingsView.swift
//  guessGame
//
//  Created by Даниил Фомин on 28/04/2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: SettingsViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var isDrawerOpen = false
    @State var isButtonCalled = false
//MARK: - TODO replace with saving to CoreData method
    @State var words: [WordApi] = []
    @State var isWordsLoaded = false
//Callback from api
    var api = APIHandler()
    
    func addWords(_ words:[WordApi] ) {
        self.words = words
    }
    
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button(action: {
                    settings.saveSettings()
                    mode.wrappedValue.dismiss()}){
                        Text("Save")
                    }
                    .padding()
            }
            Spacer()
            List{
                Text("Settings").font(.system(size: 40))
                VStack(spacing: 20) {
                    HStack {
                        Text("Round Time: ")
                        Spacer()
                        TextField("Enter a number", value: $settings.selectedTime, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .onTapGesture {
                                isDrawerOpen.toggle()
                            }
                        Spacer()
                    }
                    HStack {
                        Text("Difficulty: ")
                        Spacer()
                        Picker("Select Difficulty", selection: $settings.selectetDifficulty) {
                            ForEach(settings.avialibleDifficulty, id: \.self) { difficulty in
                                Text(difficulty)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                    Button("Load Words", action: {
                        self.api.loadData(completion: addWords)
                        self.isWordsLoaded = true
                    })
                    if isWordsLoaded {
                        
                            ForEach(words) { word in
                                Text(word.word)
                            }
                        
                    }
                }
            }
            .overlay(
                DrawerWheelView(selectedValue: $settings.selectedTime, isOpen: $isDrawerOpen, range: settings.avialibleTime)
                    .offset(y: isDrawerOpen ? UIScreen.main.bounds.height - 630  : UIScreen.main.bounds.height).navigationBarBackButtonHidden(true)
            )
        }
    }
}

struct DrawerWheelView: View {
    @Binding var selectedValue: Int
    @Binding var isOpen: Bool
    let range: [Int]
    
    var body: some View {
        VStack {
            Picker("Select a value", selection: $selectedValue) {
                ForEach(range, id: \.self) { value in
                    Text("\(value)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()
            
            Button("Close Drawer") {
                isOpen.toggle()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    let mock = SettingsViewModel()
    return SettingsView(settings: mock)
}

