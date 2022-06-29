//
//  Dailies.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 25/06/22.
//

import Foundation

class Dailies : ObservableObject {
    var date : Date = Date.now
    @Published var todaysPlanAction : [PlanClass : [Actionable]] = [:]
    @Published var goal = GoalClass(title: "Turun 10 Kg", duration: 5, startDate: Date.now, rank: .intermediate, plans: [
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
    
    
    init() {
        getTodaysPlanAndAction()
    }
    

    // Add record if action is not done within the day
//    func autoAddRecord() {
//        print("addRecord")
//    }

    func getTodaysPlanAndAction() {
//        var todaysAction : [Actionable] = []
//        var todaysPlan : [PlanClass] = []
        self.todaysPlanAction.removeAll()
        for plan in goal.plans {
            let temporaryAction = plan.actions.filter({!$0.isDoneToday && !$0.isDeleted})
            if temporaryAction.count > 0 {
                self.todaysPlanAction[plan] = temporaryAction
            }
        }
//        return (todaysPlan, todaysAction)
    }
    
    func updateAction(planId:UUID, actionId:UUID, action : String? = nil, time : String? = nil, place : String? = nil, startDate : Date? = nil, repeats : RepeatAction? = nil, difficulty : Rank? = nil) {
        var targetPlan = self.goal.plans.filter({$0.id == planId})[0]
        var targetAction = targetPlan.actions.filter({$0.id == actionId})[0]
        if let changedAction = action {
//            self.goal.plans.filter({$0.id == planId})[0].actions.filter({$0.id == actionId})[0].action = changedAction
            targetAction.action = changedAction
        }
        if let changedTime = time {
            targetAction.time = changedTime
        }
        if let changedPlace = place {
            targetAction.place = changedPlace
        }
        if let changedStartDate = startDate {
            targetAction.startDate = changedStartDate
        }
        if let changedRepeat = repeats {
            targetAction.repeats = changedRepeat
        }
        if let changedDifficulty = difficulty {
            targetAction.difficulty = changedDifficulty
        }
        targetPlan.addNewAction(action: "Bla", time: "", place: "", startDate: Date(), repeats: .daily, difficulty: .expert)
        targetPlan.actions = targetPlan.actions.filter({$0.action != "Bla"})
        self.getTodaysPlanAndAction()
    }
}
