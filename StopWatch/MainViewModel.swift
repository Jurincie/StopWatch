//
//  MainViewModel.swift
//  StopWatch
//
//  Created by Ron Jurincie on 7/14/22.
//

import Foundation
import SwiftUI
import UIKit

final class MainViewModel : ObservableObject {
    // All business logic contained in this MainViewModel
    // Observable Object
    // Implemrnt: start and pause
    // Implemrnt: continue
    // Implemrnt: reset
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var seconds:Int
    @Published var minutes:Int
    @Published var hours:Int
    @Published var mode: stopWatchMode = .stopped
    
    var timer = Timer()
    
    init() {
        seconds = 0
        minutes = 0
        hours = 0
    }
    
    func resetTappped() {
        seconds = 0
        minutes = 0
        hours = 0
        timer.invalidate()
        mode = .stopped
        print ("reset button tapped")
    }
    
    
    func startPauseContinueTapped() {
        switch mode {
        case .running:
            timer.invalidate()
            mode = .paused
            
        case .stopped: fallthrough
        case .paused:
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.seconds += 1
                
                if self.seconds == 60 {
                    self.seconds = 0
                    self.minutes += 1
                    
                    if self.minutes == 60 {
                        self.minutes = 0
                        self.hours += 1
                        
                        if self.hours == 100 {
                            self.hours = 0
                        }
                    }
                }
                
                self.mode = .running
            }
        }
    }
}
