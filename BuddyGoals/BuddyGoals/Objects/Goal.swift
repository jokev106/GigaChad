//
//  Goal.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 24/06/22.
//

import Foundation

class GoalClass {
    let goalId : String
    var title : String
    var duration : Int // in weeks
    var startDate : Date
    var plans : [PlanClass] = []
    var rank : Rank
    var totalPoints : Int = 0
    var endDate : Date = Date.now
    var isDeleted : Bool = false
    
    init(title : String, duration : Int, startDate : Date, rank : Rank, user : UserClass) {
        
        func createID(_ user : UserClass) -> String {
            let goals = user.goals
            if goals.count > 1  {
                let previousGoalID = goals[goals.count-1].goalId
                // Dibuat nanti di main app
                let goalNumber = Int(previousGoalID[previousGoalID.count - 3..<previousGoalID.count])!
                if goalNumber >= 100 {
                    return "G" + String(goalNumber + 1)
                } else if goalNumber >= 10 {
                    return "G0" + String(goalNumber + 1)
                } else {
                    return "G00" + String(goalNumber + 1)
                }
            }
            return "G001"
        }
        
        self.goalId = createID(user)
        self.title = title
        self.duration = duration
        self.startDate = startDate
        self.rank = rank
        
        self.endDate = calculateEndDate()
    }
    
    
    
    private func calculateEndDate() -> Date {
        var dateComponent = DateComponents()
        
        dateComponent.day = 7 * duration
        let calculatedEndDate = Calendar.current.date(byAdding: dateComponent, to: self.startDate)
        return calculatedEndDate!
    }
    
    func calculateRemainingDays() -> Int {
        let diffSeconds = endDate.timeIntervalSinceReferenceDate - startDate.timeIntervalSinceReferenceDate
        let diffDays = Int(diffSeconds / (60.0 * 60.0 * 24.0))
        return diffDays
    }
    
    func addNewPlan(title : String) {
        self.plans.append(PlanClass(title: title, goal: self))
    }
    
    
    func removePlan(_ id : String) {
        let removedPlan = self.plans.filter {$0.planId == id}[0]
        removedPlan.isDeleted = true
    }
    
}
