//
//  Dailies.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 25/06/22.
//

import Foundation

class Dailies {
    var date : Date = Date.now
    var todaysAction : [Actionable] = []
    var todaysPlan : [PlanClass] = []
    var goal : GoalClass
    
    init(goal : GoalClass) {
        self.goal = goal
    }
    

    // Add record if action is not done within the day
//    func autoAddRecord() {
//        print("addRecord")
//    }

    func getTodaysPlanAndAction() {
//        var todaysAction : [Actionable] = []
//        var todaysPlan : [PlanClass] = []
        self.todaysPlan = []
        self.todaysAction = []
        for plan in goal.plans {
            let temporaryAction = plan.actions.filter({!$0.isDoneToday && !$0.isDeleted})
            if temporaryAction.count > 0 {
                self.todaysAction += temporaryAction
                self.todaysPlan.append(plan)
            }
        }
//        return (todaysPlan, todaysAction)
        
    }
}
