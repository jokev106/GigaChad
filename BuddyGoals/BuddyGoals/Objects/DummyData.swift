//
//  DummyData.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 27/06/22.
//

import Foundation

struct DummyData {
    public var data : GoalClass = GoalClass(title: "Turun 10 Kg", duration: 5, startDate: Date.now, rank: .intermediate, plans: [
        PlanClass(title: "Olahraga", actions: [
            Actionable(action: "Jogging tiap Pagi", time: "05.00", place: "Kompleks", startDate: Date.now, repeats: .daily, difficulty: .intermediate),
            Actionable(action: "Push-up 100x", time: "17.00", place: "Rumah", startDate: Date.now, repeats: .weekdays, difficulty: .intermediate),
            Actionable(action: "Renang", time: "08.00", place: "Kolam", startDate: Date.now, repeats: .weekends, difficulty: .intermediate)
        ]),
        PlanClass(title: "Makan Sehat", actions: [
            Actionable(action: "Sarapan Salad", time: "07.00", place: "Rumah", startDate: Date.now, repeats: .weekdays, difficulty: .beginner),
            Actionable(action: "Makan buah tiap pagi", time: "10.00", place: "Rumah", startDate: Date.now, repeats: .daily, difficulty: .beginner)
        ])
    ])
}
