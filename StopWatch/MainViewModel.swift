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
    
    @Published var timerIsRunning: Bool
    @Published var seconds:Int
    @Published var minutes:Int
    @Published var hours:Int
    
    var notStarted = true

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init() {
        seconds = 35
        minutes = 29
        hours = 12
        timerIsRunning = false
    }
    func startPauseContinueTapped() {
        if notStarted == true { notStarted = false}
        timerIsRunning.toggle()
        print ("start/pause button tapped")
    }
    
    func resetTappped() {
        seconds = 0
        minutes = 0
        hours = 0
        timerIsRunning = false
        print ("reset button tapped")
    }



}
