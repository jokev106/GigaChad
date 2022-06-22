//
//  AddMissionView.swift
//  BuddyGoals
//
//  Created by Jonathan Kevin on 21/06/22.
//

import SwiftUI

struct AddMissionView: View {
    
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var milestoneTitle:  String = ""
    @State private var startDatePicker = Date()
    
    var body: some View {
        GeometryReader{ geo in
            
            VStack{
                
                NavigationView{
                    Form{
                        //Mission title section set up
                        Section (header: Text("Title")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                        TextField("Ex: Morning Run", text: $milestoneTitle)
                                .padding(.all, 7.0)
                            .foregroundColor(Color.black)
                        //                            .padding(.horizontal)
                        }
                        
                        //Commitment section set up
                        Section (header: Text("Commitment")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                        TextField("Ex: Run for 30 minutes or 2 miles", text: $milestoneTitle)
                                .padding(.all, 7.0)
                            .foregroundColor(Color.black)
                        //                            .padding(.horizontal)
                        }
                        
                        //Detail set up
                        Section (header: Text("Details")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            DatePicker("Time", selection: $startDatePicker, displayedComponents: .hourAndMinute)
                                .foregroundColor(Color.black)
                            TextField("Where", text: $milestoneTitle)
                                .padding(.all, 4.0)
                            .foregroundColor(Color.black)
                        }
                        
                        //Schedule set up
                        Section (header: Text("Schedule")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            DatePicker("Start Date", selection: $startDatePicker, in: Date()..., displayedComponents: .date)
                                .foregroundColor(Color.black)
                            TextField("Where", text: $milestoneTitle)
                            .padding(.all, 4.0)
                            .foregroundColor(Color.black)
                        }
                    }//Vstack line 22
                    //content
                    
                    
                    //navbar Setting
                    .navigationBarTitle(
                        Text("New Mission").bold(),
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
    }
}

struct AddMissionView_Previews: PreviewProvider {
    static var previews: some View {
        AddMissionView()
    }
}
