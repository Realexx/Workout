//
//  TimerView.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    @ObservedObject var viewModel = MapModel()
    @State var categorie: Categorie = .Riding
    var body: some View {
        VStack {
            Spacer()
            
            Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                .padding()
                .font(.system(size: 40, weight: .medium))
            
            Text("\(0) m")
                .padding()
                .font(.system(size: 40, weight: .medium))
            
            Spacer()
            
            Picker("Categorie", selection: $categorie){
                ForEach(Categorie.allCases, id: \.self){categorie in
                    Text(categorie.symbol)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 350)
            
            if stopWatchManager.mode == .stopped {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "⏱ Go", ButtonColor: .orange)
                }
            }
            
            if stopWatchManager.mode == .running {
                Button(action: {self.stopWatchManager.pause()}) {
                                TimerButton(label: "⏸ Pause", ButtonColor: .red)
                }
            }
            
            HStack {
                if stopWatchManager.mode == .paused {
                    Button(action: {self.stopWatchManager.start()}) {
                        TimerButton(label: "⏩ Resume", ButtonColor: .orange)
                    }
                    Button(action: {self.stopWatchManager.stop()}) {
                        TimerButton(label: "⏹ Stop", ButtonColor: .red)
                    }
                }
            }
        
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
        
    }
}

struct TimerButton: View {
    let label: String
    let ButtonColor: Color
    
    var body: some View {
        Text(label)
            .font(.system(size: 25, weight: .medium))
            .foregroundColor(.white)
            .padding(.vertical, 20)
            .padding(.horizontal, 75)
            .background(ButtonColor)
            .cornerRadius(50)
    }
}
