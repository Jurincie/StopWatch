//
//  ContentView.swift
//  StopWatch
//
//  Created by Ron Jurincie on 7/14/22.
//

import SwiftUI
import UIKit

/* Create a Stop Watch. having start, Pause, Continue and Reset functionalities.
 Should Display timer in format HH:MM::SS format
 Use MVVM design pattern
 Write Unit Test Cases
 */


struct MainView: View {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {
        VStack() {
            Spacer(minLength:80)
            Text("Stopwatch")
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .frame(width:300, alignment: .center)
            HHmmssView()
                .frame(maxWidth: 300)
                .padding(20)
            Spacer()
            ControlsView()
                .padding(20)
        }
        .background(LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea()
    }
}

struct HHmmssView: View {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {
        HStack() {
            Spacer()
            Text("\(mainVM.hours / 10)")
                .fontWeight(.bold)
                .frame(width: 20, height:80)
                .font(.largeTitle)
                .accessibilityIdentifier("hoursOne")
            
            Text("\(mainVM.hours % 10)")
                .fontWeight(.bold)
                .frame(width: 20, height:80)
                .font(.largeTitle)
                .accessibilityIdentifier("hoursTwo")
            
            Text(":")
                .fontWeight(.heavy)
                .frame(width: 20, height:80)
                .font(.largeTitle)

            Text("\(mainVM.minutes / 10)")
                .fontWeight(.bold)
               .frame(width: 20, height:80)
               .font(.largeTitle)
               .accessibilityIdentifier("minutesOne")

            Text("\(mainVM.minutes % 10)")
                .fontWeight(.bold)
                .frame(width: 20, height:80)
                .font(.largeTitle)
                .accessibilityIdentifier("minutesTwo")
                
            Text(":")
                .fontWeight(.heavy)
                .frame(width: 20, height:80)
                .font(.largeTitle)

            Text("\(mainVM.seconds / 10)")
                .fontWeight(.bold)
                .frame(width: 20, height:80)
                .font(.largeTitle)
                .accessibilityIdentifier("secondsOne")

            Text("\(mainVM.seconds % 10)")
                .fontWeight(.bold)
                .frame(width: 20, height:80)
                .font(.largeTitle)
                .accessibilityIdentifier("secondsTwo")
            Spacer()
        }
        .background(Color.yellow)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth:10)
        )
    }
}

struct ResetButton : View {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {
        Button("RESET"){
            mainVM.resetTappped()
        }
        .padding()
        .font(.title)
        .background(Color.red)
        .foregroundColor(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth:5))
    }
}

struct StartButton: View {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {
        Button(
            mainVM.mode == .stopped ? "START" : mainVM.mode == .running ? "PAUSE" : "CONTINUE") {
                mainVM.startPauseContinueTapped()
        }
        .padding()
        .font(.title)
        .background(mainVM.mode == .stopped ? Color.green : mainVM.mode == .running ? Color.secondary : Color.green)
        .foregroundColor(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth:5)
        )
    }
}
struct ControlsView: View {
    @StateObject var mainVM = MainViewModel.shared

    var body: some View {
        HStack() {
            Spacer()
            StartButton()
            Spacer()
            Spacer()
            Spacer()
            ResetButton()
            Spacer()
        }
        .padding(20)
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
