//
//  Actionable.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 24/06/22.
//

import Foundation


struct Actionable {
    // ID = GoalID + PlanID + ActionID
    let actionId : String
    var action : String
    var time : String // No time data type (?)
    var place : String
    var startDate : Date
    var repeats : RepeatAction
    var difficulty : Rank
//    var records : [RecordsOfAction] = []    // Nanti dipakai waktu sudah bikin app beneran
    var isDoneToday : Bool = false
    var isDeleted : Bool = false
    
    init(action : String, time : String, place : String, startDate : Date, repeats : RepeatAction, difficulty : Rank, plan : PlanClass) {
        func createID(_ plan : PlanClass) -> String {
            let actions = plan.actions
            if actions.count > 1  {
                let previousActionID = actions[actions.count-1].actionId
                let actionNumber = Int(previousActionID[previousActionID.count - 3..<previousActionID.count])!
                if actionNumber >= 100 {
                    return plan.planId + "A" + String(actionNumber + 1)
                } else if actionNumber >= 10 {
                    return plan.planId + "A0" + String(actionNumber + 1)
                } else {
                    return plan.planId + "A00" + String(actionNumber + 1)
                }
            }
            return plan.planId + "A001"
        }
        
        self.actionId = createID(plan)
        self.action = action
        self.time = time
        self.place = place
        self.startDate = startDate
        self.repeats = repeats
        self.difficulty = difficulty
        
    }
    
    
    
    
}
