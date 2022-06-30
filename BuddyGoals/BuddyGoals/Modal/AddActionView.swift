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
    
    //var for submission image picker
    @State var changeSubmissionImage = false
    @State var openCameraSheet = false
    @State var imageSelected = UIImage()
    
    let repeatOptions: [String] = [
        "Never", "Daily", "Weekdays", "Weekends", "Weekly", "Biweekly", "Monthly", "Every 3 Months", "Every 6 Months", "Yearly"
    ]
    var imageDifficulty: [String] = [
        "dTrivial", "dEasy", "dMedium", "dHard", "dExpert"
    ]
    
    //Bool difficulty
        @State var isTappedDifficultyTrivial = false
        @State var isTappedDifficultyEasy = false
        @State var isTappedDifficultyMedium = false
        @State var isTappedDifficultyHard = false
        @State var isTappedDifficultyExpert = false
    
    
//    @State var isTappedDifficulty = false
      @State var isTappedDetails = false

    
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
                                        isTappedDetails = true
                                    }
                                }
                            } onCommit: {
                                if detailsWhere == "" {
                                    withAnimation(.easeOut){
                                        isTappedDetails = false
                                    }
                                }
                            }
                            .background(
                                Text("Where")
                                    .scaleEffect(isTappedDetails ? 0.8 : 1)
                                    .offset(x: isTappedDetails ? 0 : 0, y: isTappedDetails ? -14 : 0 )
                                    .foregroundColor(isTappedDetails ? Color.blue : Color.gray)
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
                        Section(header: Text("Difficulty")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            HStack{
                                //difficulty image button list
                                Image(isTappedDifficultyTrivial ? "dTrivial" : "dTrivialGray")
                                    .onTapGesture {
                                        self.isTappedDifficultyTrivial.toggle()
                                    }
                                Spacer()
                                Image(isTappedDifficultyEasy ? "dEasy" : "dEasyGray")
                                    .onTapGesture {
                                        self.isTappedDifficultyEasy.toggle()
                                    }
                                Spacer()
                                Image(isTappedDifficultyMedium ? "dMedium" : "dMediumGray")
                                    .onTapGesture {
                                        self.isTappedDifficultyMedium.toggle()
                                    }
                                Spacer()
                                Image(isTappedDifficultyHard ? "dHard" : "dHardGray")
                                    .onTapGesture {
                                        self.isTappedDifficultyHard.toggle()
                                    }
                                Spacer()
                                Image(isTappedDifficultyExpert ? "dExpert" : "dExpertGray")
                                    .onTapGesture {
                                        self.isTappedDifficultyExpert.toggle()
                                    }
//                                ForEach(imageDifficulty, id: \.self){
//                                    imageDifficulties in
//                                    Button(action:{
//                                        self.isTappedDifficulty.toggle()
//                                    }){
//                                        Image(isTappedDifficulty ? imageDifficulties : imageDifficulties + "Gray")
//                                    }.onChange(of: imageDifficulty, perform: { imageDifficulties in
//                                        if imageDifficulties == imageDifficulty  {
//                                        }else{
//
//                                        }
//
//                                    })
//                                    .padding(.horizontal, 11.0)
//                                }

                            }//Hstack
                        }
                        
                        //Submission image
                        Section(header: Text("Submission")
                                    .foregroundColor(Color.blue)
                                    .bold()
                        ){
                            HStack{
                                Spacer()
                                //Add photo from library
                                Button(action:{
                                    changeSubmissionImage = true
                                    openCameraSheet = true
                                }){
                                    if changeSubmissionImage {
                                        Image(uiImage: imageSelected)
                                            .resizable()
                                            .foregroundColor(primary900)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100, alignment: .center)
                                    }else {
                                        Image(systemName: "photo.fill")
                                            .resizable()
                                            .foregroundColor(primary900)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50, alignment: .center)
                                    }
                                }.sheet(isPresented: $openCameraSheet) {
                                    SubmissionPicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                                }
                                Spacer()
                                Rectangle()
                                    .frame(width: 1, height: 100)
                                    .foregroundColor(Color.gray
                                    )
                                    .padding(5)
                                Spacer()
                                //Add photo from camera
                                Button(action:{
                                    
                                }){
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .foregroundColor(primary900)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50, alignment: .center)
                                }
                                Spacer()
                            } //HStack
                            
                        }
                    }//Vstack line 22
                    //content
                    
                    
                    //navbar Setting
                    .navigationBarTitle(
                        Text("Add Action").bold(),
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
                .navigationAppearance(backgroundColor: UIColor(primary900), foregroundColor: .white, hideSeperator: true)
            }//Vstack Line 16
        }//geometryReader
    }

}

struct AddActionView_Previews: PreviewProvider {
    static var previews: some View {
        AddActionView()
    }
}

