//
//  Plan.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 24/06/22.
//

import Foundation

class PlanClass {
    
    // ID = GoalID + PlanID
    let planId : String
    var title : String
    var actions : [Actionable] = []
    var isDeleted : Bool = false
    
    
    
    init(title : String, goal : GoalClass) {
        func createID(_ goal : GoalClass) -> String {
            let plans = goal.plans
            if plans.count > 0  {
                let previousPlanID = plans[plans.count-1].planId
                // Dibuat nanti di main app
                let planNumber = Int(previousPlanID[previousPlanID.count - 3..<previousPlanID.count])!
                if planNumber >= 100 {
                    return goal.goalId + "P" + String(planNumber + 1)
                } else if planNumber >= 10 {
                    return goal.goalId + "P0" + String(planNumber + 1)
                } else {
                    return goal.goalId + "P00" + String(planNumber + 1)
                }
            }
            return goal.goalId + "P001"
        }
        
        self.planId = createID(goal)
        self.title = title
    }
    
    func addNewAction(action : String, time : String, place : String, startDate : Date, repeats : RepeatAction, difficulty : Rank) {
        self.actions.append(Actionable(action: action, time: time, place: place, startDate: startDate, repeats: repeats, difficulty: difficulty, plan: self))
    }
    
    
    func removeAction(_ id : String) {
        var removedAction = self.actions.filter {$0.actionId == id}[0]
        removedAction.isDeleted = true
    }
    
    
    
}
