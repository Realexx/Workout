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
    @Published var secondsElapsed = 0
    @Published var minutesElapsed = 0
    @Published var hoursElapsed = 0
    var timer = Timer()
    var timerMinutes = Timer()
    var timerHours = Timer()
    @Published var mode: stopWatchMode = .stopped
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            self.secondsElapsed += 1
            if secondsElapsed == 60 {
                secondsElapsed = 0
            }
        }
        timerMinutes = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [self] timer in
            self.minutesElapsed += 1
            if minutesElapsed == 60 {
                minutesElapsed = 0
            }
        }
        timerHours = Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { [self] timer in
            self.hoursElapsed += 1
        }
    }
    
    func pause() {
        timer.invalidate()
        timerMinutes.invalidate()
        timerHours.invalidate()
        mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        timerMinutes.invalidate()
        timerHours.invalidate()
        secondsElapsed = 0
        minutesElapsed = 0
        hoursElapsed = 0
        mode = .stopped
    }
    
    
}
