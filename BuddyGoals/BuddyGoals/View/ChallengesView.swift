//
//  ContentView.swift
//  BuddyGoals
//
//  Created by Jonathan Kevin on 20/06/22.
//

import SwiftUI
import CoreData

struct ChallengesView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
//    //for White Content Navigation Bar
//    init() {
//       let navBarAppearance = UINavigationBar.appearance()
//       navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//       navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//    }

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                ScrollView {
                    
                    ZStack {
                        primary900
                            .edgesIgnoringSafeArea(.top)
                            .frame(height: 200)
                        
                        //Card
                        Button(action: {
                            //DO action
                        }, label: {
                            VStack{
                                HStack {
                                    Text("Being Productive")
                                        .font(.system(size: 25, weight: .bold))
                                        .frame(alignment: .leading)
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .padding(.trailing, 10)
                                        .foregroundColor(Color.gray)
                                }
                                
                                Text("15 Days to go")
                                    .font(.system(size: 8))
                                    .padding(7)
                                    .foregroundColor(Color.black)
                                    .background(white)
                                    .cornerRadius(10)
                                
                            }
                            .padding()
                            .background(.white)

                        })//Button card
                        .cornerRadius(10)
                        .padding()
                        //Close of Card
                        
                    } //ZStack
                    
                    VStack(spacing:0){
                        
                        HStack {
                            Text("Exercise")
                                .foregroundColor(.gray)
                                .font(.system(size: 22.5))
                                .bold()
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 20, weight: .bold))
                            })
                        }.padding()
                        
                        //Card
                        CardView(imageCard: "Stars_4", colorCard: purple, milestone: "abla", destinationCard: "")
                        CardView(imageCard: "Stars_3", colorCard: blue, milestone: "lol lol abla", destinationCard: "")
                        CardView(imageCard: "Stars_3", colorCard: blue, milestone: "lol lol abla", destinationCard: "")
                        CardView(imageCard: "Stars_3", colorCard: blue, milestone: "lol lol abla", destinationCard: "")
                        CardView(imageCard: "Stars_3", colorCard: blue, milestone: "lol lol abla", destinationCard: "")
                        //CardView()
                        //Close of Card
                        
                        Spacer()

                    } //VStack
                } //Scrollview
                
           
            } //VStack
            .navigationTitle("Goal")
//            .toolbar {
//                ToolbarItemGroup(placement: .navigationBarTrailing){
//                    Button(action: {
//                        //Do action
//                    }, label: {
//                        Image(systemName: "bell.fill")
//                            //.foregroundColor(.white)
//                    })
//                }
//            } //Toolbar
    
        } //Navigation View
        
    } //Close of View
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



