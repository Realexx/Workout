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
            
            Button(action: {self.stopWatchManager.start()}) {
                TimerButton(label: "Go", ButtonColor: .orange)
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
