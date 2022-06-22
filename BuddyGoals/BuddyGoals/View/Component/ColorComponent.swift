//
//  ColorComponent.swift
//  BuddyGoals
//
//  Created by I Gede Bagus Wirawan on 22/06/22.
//

import Foundation
import SwiftUI

let grayButton = Color("grayColor")
let blueGiga = Color("blueUIColor")


//ZStack { //Zstack
//    
//    VStack {
//        blueGiga
//            .edgesIgnoringSafeArea(.top)
//            .frame(height: 130)
//       
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        } //Navigation
//    }
//
//    VStack {//VStack
//        Text("Hi Giga! ")
//            .font(.system(size: 25, weight: .bold, design: .default))
//            .padding(10)
//            .frame(maxWidth: .infinity, alignment: .leading)
//        
//        Text("Lose 10 kg in 3 months")
//            .font(.system(size: 21, weight: .bold, design: .default))
//            .border(Color("blueUIColor"))
//            .padding(10)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .frame(maxWidth: .infinity)
//
//    }
//    .frame(width: 350)
//    .background(.white)
//    .clipShape(RoundedRectangle(cornerRadius: 20))
//    .shadow(radius: 20)
//    .position(x: 100, y: 100)
//    //Close VStack card
//        
//} //Close ZStack for all
