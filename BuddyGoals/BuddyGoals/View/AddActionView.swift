//
//  AddActionView.swift
//  BuddyGoals
//
//  Created by Jonathan Kevin on 24/06/22.
//

import SwiftUI

struct AddActionView: View {
    
    //modal view(presentation) mode
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    //var for form input
    @State private var actionTitle:  String = ""
    @State private var actionCommitment:  String = ""
    @State private var detailsDatePicker = Date()
    @State private var detailsWhere:  String = ""
    @State private var scheduleDatePicker = Date()
    @State private var repeatPicker: String = "Daily"
    
    let repeatOptions: [String] = [
        "Never", "Daily", "Weekdays", "Weekends", "Weekly", "Biweekly", "Monthly", "Every 3 Months", "Every 6 Months", "Yearly"
    ]
    
    @State var isTapped = false
    
    var body: some View {
        GeometryReader{ geo in
            
            VStack{
                
                NavigationView{
                    Form{
                        //Mission title set up section
                        Section (header: Text("Title")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            TextField("Ex: Morning Run", text: $actionTitle)
                                .padding(.all, 7.0)
                                .foregroundColor(Color.black)
                            //                            .padding(.horizontal)
                        }
                        
                        //Commitment set up section
                        Section (header: Text("Commitment")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            TextField("Ex: Run for 30 minutes or 2 miles", text: $actionCommitment)
                                .padding(.all, 7.0)
                                .foregroundColor(Color.black)
                            //                            .padding(.horizontal)
                        }
                        
                        //Detail set up
                        Section (header: Text("Details")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            DatePicker("Time", selection: $detailsDatePicker, displayedComponents: .hourAndMinute)
                                .padding(.leading, 5.0)
                                .foregroundColor(Color.black)
                            TextField("", text: $detailsWhere){
                                (status) in
                                if status{
                                    withAnimation(.easeIn){
                                        isTapped = true
                                    }
                                }
                            } onCommit: {
                                if detailsWhere == "" {
                                    withAnimation(.easeOut){
                                        isTapped = false
                                    }
                                }
                            }
                            .background(
                                Text("Where")
                                    .scaleEffect(isTapped ? 0.8 : 1)
                                    .offset(x: isTapped ? 0 : 0, y: isTapped ? -14 : 0 )
                                    .foregroundColor(isTapped ? Color.blue : Color.gray)
                                , alignment: .leading
                            
                            )
                                .padding(.all, 5.0)
                                .foregroundColor(Color.black)
                        }
                        
                        //Schedule set up
                        Section (header: Text("Schedule")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            DatePicker("Start Date", selection: $scheduleDatePicker, in: Date()..., displayedComponents: .date)
                                .padding(.leading, 5.0)
                                .foregroundColor(Color.black)
                            HStack{
                                Text("Repeat")
                                    .padding(.all, 5.0)
                                    .foregroundColor(Color.black)
                                Spacer()
                                Picker(
                                    selection: $repeatPicker,
                                    label:
                                        HStack{
                                            Text(repeatPicker)
                                                .foregroundColor(Color.black)
                                                .font(.headline)
                                                .background(Color.black)
                                        },
                                    content: {
                                        ForEach(repeatOptions, id: \.self){
                                            option in
                                            HStack{
                                                Text(option)
                                            }
                                            .tag(option)
                                        }//forEachContent
                                    }//pickerContent
                                )//Picker
                                    .pickerStyle(MenuPickerStyle())
                                    .foregroundColor(Color.black)
                            }//Hstack
                        }
                        //Difficulty set up section
                        Section{
                            HStack{
                                //difficulty : trivial
                                Button(action:{}){
                                    
                                }
                            }//Hstack
                        }
                    }//Vstack line 22
                    //content
                    
                    
                    //navbar Setting
                    .navigationBarTitle(
                        Text("New Mission").bold(),
                        displayMode: .inline)
                    .foregroundColor(Color.white)
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

struct AddActionView_Previews: PreviewProvider {
    static var previews: some View {
        AddActionView()
    }
}
