//
//  Actionable.swift
//  BuddyGoals
//
//  Created by Terrence Pramono on 24/06/22.
//

import Foundation


class Actionable: Identifiable {
    var id = UUID()
    
    
    // ID = GoalID + PlanID + ActionID
//    let actionId = UUID()
    var action : String
    var time : String // No time data type (?)
    var place : String
    var startDate : Date
    var repeats : RepeatAction
    var difficulty : Rank
//    var records : [RecordsOfAction] = []    // Nanti dipakai waktu sudah bikin app beneran
    var isDoneToday : Bool = false
    var isDeleted : Bool = false
    
    init(action : String, time : String, place : String, startDate : Date, repeats : RepeatAction, difficulty : Rank) {
        
        self.action = action
        self.time = time
        self.place = place
        self.startDate = startDate
        self.repeats = repeats
        self.difficulty = difficulty
        
    }
    
    
    
    
}
