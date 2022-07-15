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
    @StateObject var mainVM = MainViewModel()
    
    var body: some View {
        VStack() {
            Spacer()
            HStack() {
                Spacer()
                Text("\(mainVM.hours / 10)")
                    .fontWeight(.bold)
                    .frame(width: 20, height:80)
                    .font(.title)
                Text("\(mainVM.hours % 10)")
                    .fontWeight(.bold)
                    .frame(width: 20, height:80)
                    .font(.title)
                Text(":")
                    .fontWeight(.bold)
                    .frame(width: 20, height:80)
                    .font(.title)

                Text("\(mainVM.minutes / 10)")
                    .fontWeight(.bold)
                   .frame(width: 20, height:80)
                   .font(.title)

                Text("\(mainVM.minutes % 10)")
                    .fontWeight(.bold)
                    .frame(width: 20, height:80)
                    .font(.title)
                    
                Text(":")
                    .fontWeight(.bold)
                    .frame(width: 20, height:80)
                    .font(.title)

                Text("\(mainVM.seconds / 10)")
                    .fontWeight(.bold)
                    .frame(width: 20, height:80)
                    .font(.title)

                Text("\(mainVM.seconds % 10)")
                    .fontWeight(.bold)
                    .frame(width: 20, height:80)
                    .font(.title)
                Spacer()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth:10)
            )

            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            HStack() {
                Button(mainVM.mode == .stopped ? "Start" : mainVM.mode == .running ? "Pause" : "Continue") {
                    mainVM.startPauseContinueTapped()
                }
                .frame(maxWidth:.infinity)
                .font(.headline)
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth:10)
                )
                .background(Color.black)
                .foregroundColor(Color.white)

                Button("Reset"){
                    mainVM.resetTappped()
                }
                .frame(maxWidth:.infinity)
                .font(.headline)
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth:10)
                )
                .background(Color.black)
                .foregroundColor(Color.white)
            }
            
        }
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
