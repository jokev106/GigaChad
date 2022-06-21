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
                    VStack{
                        
                        //Mission title set up
                        Text("Title")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        TextField("Ex: Morning Run", text: $milestoneTitle)
                            .padding()
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            .padding(.horizontal)
                        
                        //Commitment set up
                        Text("Commitment")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        TextField("Ex: Run for 30 minutes around the block", text: $milestoneTitle)
                            .padding()
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            .padding(.horizontal)
                        
                        //Detail schedule set up
                        Text("Detail")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        Form{
                            Section{
                                DatePicker("Start Date", selection: $startDatePicker, displayedComponents: .hourAndMinute)
                                    .padding()
                                    .foregroundColor(Color.black)
//                                    .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            }
                        }
                        
                        //Schedule set up
                        Text("Detail")
                            .foregroundColor(Color.blue)
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding([.top, .leading], 26.0)
                        DatePicker("Start Date", selection: $startDatePicker)
                            .padding()
                            .foregroundColor(Color.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                            .padding(.horizontal)
                        Spacer()
                    }
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
