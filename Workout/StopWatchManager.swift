//
//  StopWatchManager.swift
//  Workout
//
//  Created by schlageter alex on 04/03/2022.
//

import SwiftUI

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class StopWatchManager: ObservableObject {
    @Published var secondsElapsed = 0.0
    var timer = Timer()
    @Published var mode: stopWatchMode = .stopped
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.secondsElapsed += 0.1
        }
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stopped
    }
    
    
}
