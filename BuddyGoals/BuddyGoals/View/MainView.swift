//
//  MainView.swift
//  BuddyGoals
//
//  Created by I Gede Bagus Wirawan on 20/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TravenView()
                .tabItem{
                    Label("Traven", systemImage: "person.3.fill")
                }
            
            ChallengesView()
                .tabItem{
                    Label("Challanges", systemImage: "checkmark.square.fill")
                }

            ProgressView()
                .tabItem{
                    Label("Progress", systemImage: "calendar")
                }
        }.accentColor(Color("darkpurpleUIColor"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
