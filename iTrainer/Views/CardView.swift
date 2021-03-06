//
//  CardView.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import SwiftUI

struct CardView: View {
    let exercise: ExerciseRoutine // new struct property
    var body: some View {
        VStack(alignment: .leading){
            Text(exercise.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack{
                Label("\(exercise.movements.count)", systemImage: "bolt.horizontal.fill")
                    .accessibilityLabel("\(exercise.movements.count) exercises")
                Spacer()
                Label("\(exercise.lengthInMinutes)", systemImage: "clock.arrow.2.circlepath")
                    .accessibilityLabel("\(exercise.lengthInMinutes) minute routine")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(exercise.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var exercise = ExerciseRoutine.sampleData[0] // create a mock property to instantiate the card view
    static var previews: some View {
        CardView(exercise: exercise)
            .background(exercise.theme.mainColor) // this sets the bkg colour based on the theme define earlier
            .previewLayout(.fixed(width: 400, height: 60)) // this is what makes it a smaller view
    }
}
