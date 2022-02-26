//
//  ExerciseView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-24.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var exercises: [DailyExercise]
    
    var body: some View {
        List {
            ForEach($exercises) { $exercise in // ( ... ) is the initilizer
                NavigationLink(destination: DetailView(exercise: $exercise)){
                    CardView(exercise: exercise)
                }
                .listRowBackground(exercise.theme.mainColor)
            }
        }
        .navigationTitle("Daily Exercises")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus.circle")
            }
            .accessibilityLabel("New Exercise")
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // adding this shows titles and bar buttons on the canvas
            ExerciseView(exercises: .constant(DailyExercise.sampleData)) // initialize with class parameters
        }
    }
}
