//
//  AddChallengeView.swift
//  BuddyGoals
//
//  Created by Jonathan Kevin on 21/06/22.
//

import SwiftUI

struct AddChallengeView: View {
    
    //    @Environment(\.dismiss) var dismissSheetView
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var milestoneTitle:  String = ""
    @State private var startDatePicker = Date()
    
    var body: some View {
        GeometryReader{ geo in
            
            VStack{
                NavigationView{
                    VStack{
                        
                        //Milestone set up
                        Text("Milestone")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        TextField("Ex: Exercise", text: $milestoneTitle)
                            .padding()
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            .padding(.horizontal)
                        
                        //Schedule set up
                        Text("Schedule")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        DatePicker("Start Date", selection: $startDatePicker, in: Date()...)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            .padding(.horizontal)
                        Spacer()
                    }
                    //content
                    
                    
                    //navbar Setting
                    .navigationBarTitle(
                        Text("New Milestone").bold(),
                        displayMode: .inline)
                    .navigationBarItems(leading:
                                            //Cancel Button
                                        Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel").bold()
                    }, trailing: Button(action: {
                        
                    }) {
                        Text("Create").bold()
                    })
                    .foregroundColor(Color.white)
                }//navigationView
                .navigationAppearance(backgroundColor: .systemBlue, foregroundColor: .white, hideSeperator: true)
            }//Vstack Line 16
        }//geometryReader
    }//bodyView
}

struct AddChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        AddChallengeView()
    }
}

