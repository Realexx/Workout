//
//  StopWatchManager.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import SwiftUI

class StopWatchManager: ObservableObject {
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
}
