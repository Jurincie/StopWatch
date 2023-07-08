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
    // Implemrnt: start and pause and continue on top button
    // Implemrnt: reset on bottom button
    
    // Using MVVM with this as the only ViewModel
    // By making this class ObservableObject with:
    //      published variables for seconds, minutes, hours and mode
    // The MainView will reauculate itself whenever any of those values change
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    
    @Published var seconds:Int
    @Published var minutes:Int
    @Published var hours:Int
    @Published var mode: stopWatchMode = .stopped
    var secondsPassed: Int
    var timer = Timer()
    
    static let shared = MainViewModel()
    
    init() {
        self.secondsPassed = 0
        
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
    }
    
    func resetTappped() {
        
        timer.invalidate()
        self.secondsPassed = 0
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
        
        mode = .stopped
    }
    
    func setStaticText() {
        if self.secondsPassed == 3600 { self.secondsPassed = 0 }
        
        self.hours      = self.secondsPassed / 3600
        self.minutes    = (self.secondsPassed - self.hours * 3600) / 60
        self.seconds    = self.secondsPassed % 60
        self.mode = .running
    }
    
    
    func startPauseContinueTapped() {
        switch mode {
        case .running:
            timer.invalidate()
            mode = .paused
            
        case .stopped: fallthrough
        case .paused:
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.secondsPassed += 1
                
                self.setStaticText()
            }
        }
    }
}
