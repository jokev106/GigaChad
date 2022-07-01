//
//  EditGoalView.swift
//  BuddyGoals
//
//  Created by I Gede Bagus Wirawan on 28/06/22.
//

import SwiftUI

struct EditGoalView: View {
    //    @Environment(\.dismiss) var dismissSheetView
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var milestoneTitle:  String = ""
    @State private var startDatePicker = Date()
    
    @EnvironmentObject var activityToday : Dailies
    
    let formatter = DateFormatter()
    @State var lowerBoundDateTime = Date()
    
    var body: some View {
        GeometryReader{ geo in
            
            VStack{
                NavigationView{
                    VStack {
                        
                        //Milestone set up
                        Text("Goal")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        TextField("Input your goal", text: $milestoneTitle)
                            .padding()
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            .padding(.horizontal)
                        
                        //Schedule set up
                        Text("Scheduling")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        
                        
                        DatePicker("Start Date", selection: $startDatePicker, in: lowerBoundDateTime...)
//                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                    //content
                    
                    
                    //navbar Setting
                    .navigationBarTitle(
                        Text("Edit Goal").bold(),
                        displayMode: .inline)
                    .navigationBarItems(leading:
                                            //Cancel Button
                                        Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel").bold()
                    }, trailing: Button(action: {
                        activityToday.goal.title = $milestoneTitle.wrappedValue
                        activityToday.goal.startDate = $startDatePicker.wrappedValue
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done").bold()
                    })
                    .foregroundColor(Color.white)
                }//navigationView
                .navigationAppearance(backgroundColor: UIColor(primary900), foregroundColor: .white, hideSeperator: true)
                .onAppear {
                    milestoneTitle = activityToday.goal.title
                    startDatePicker = activityToday.goal.startDate
                    formatter.dateFormat = "yyyy/MM/dd HH:mm"
                    lowerBoundDateTime = formatter.date(from: "2016/01/01 00:00")!
                }
            }//Vstack Line 23
        }//geometryReader
    }//bodyView
        
}

struct EditGoalView_Previews: PreviewProvider {
    static var previews: some View {
        EditGoalView()
            .environmentObject(Dailies())
    }
}
