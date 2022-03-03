//
//  ContentView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

struct TimerView: View {
    @Binding var exercise: DailyExercise
    @StateObject var exerciseTimer = ExerciseTimer() // @StateObject sets this instance as the source of truth 
    
    var body: some View {
        // contains the main components of the view
        ZStack { // overlay
            RoundedRectangle(cornerRadius: 8.0)
                .fill(exercise.theme.mainColor)
            VStack { // this stacks the view vertically
                TimerHeaderView(secondsElapsed: exerciseTimer.secondsElapsed, secondsRemaining: exerciseTimer.secondsRemaining, theme: exercise.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                HStack {
                    Text("Movement 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding()
        .foregroundColor(exercise.theme.accentColor)
        .onAppear{ // lifecycle event for when the view appears on the screen
            exerciseTimer.reset(lengthInMinutes: exercise.lengthInMinutes, routineMovements: exercise.movements) // reset the timer to start a new session
            exerciseTimer.startExercise()
        }
        .onDisappear{
            exerciseTimer.stopExercise()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(exercise: .constant(DailyExercise.sampleData[0]))
    }
}
