//
//  DailyExercise.swift
//  iTrainer
//
//  Created by Ryan Chang on 2022-02-23.
//

import Foundation

struct DailyExercise: Identifiable { // identfiable protocal ensures uniqueness between elements
    let id: UUID // necessary for hte identfiable protocal
    var title: String
    var movements: [String]
    var lengthInMinutes: Int
    var theme: Theme
    
    // assigned default value to id (id: UUID = UUID()) -> enables you to omit the parameter during initialization
    init(id: UUID = UUID(), title: String, movements: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.movements = movements
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyExercise {
    static let sampleData: [DailyExercise] =
    [
        DailyExercise(title: "Morning Chest Routine", movements: ["Dumbell Press", "Dumbell Fly", "Barbell Press"], lengthInMinutes: 10, theme: .ocean),
        DailyExercise(title: "Afternoon Arm Routine", movements: ["Perniated Curls", "Tricept Dips", "Extended Curl"], lengthInMinutes: 10, theme: .poppy),
        DailyExercise(title: "Night Abs Routine", movements: ["Alternating Leg Raises", "Boat Hold", "Bicycles"], lengthInMinutes: 10, theme: .yellow)
    ]
}
