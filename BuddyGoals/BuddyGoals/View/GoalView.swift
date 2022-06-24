//
//  ContentView.swift
//  BuddyGoals
//
//  Created by Jonathan Kevin on 24/06/22.
//

import SwiftUI
import CoreData

struct GoalView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //for White Content Navigation Bar
    init() {
       let navBarAppearance = UINavigationBar.appearance()
       navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
       navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State var addNewPlanView = false
    
    var body: some View {
        
        NavigationView {
            
            //ScrollView{
                ZStack {
                    
                    VStack{
                        primary900
                            .frame(height: 300, alignment: .top)
                            .ignoresSafeArea(.all)
                        Spacer()
                    }
                    VStack {
                        
                        //Spacer(minLength: 10)
                        
                        //Card
                        Button(action: {
                            //DO action
                        }, label: {
                            VStack{
                                HStack {
                                    Text("Lose 10 Kg in 10 months")
                                        .font(.system(size: 25, weight: .bold))
                                        .frame(alignment: .topTrailing)
                                        .foregroundColor(Color.black)

                                    Spacer()

                                    Button(action: {
                                        
                                    }, label: {
                                        Text("Edit")
                                            .font(.system(size: 10))
                                            .padding(5)
                                            .background(white)
                                            .cornerRadius(10)
                                    })

                                    //Image(systemName: "chevron.right")
                                        // .padding(.trailing, 10)
                                        // .foregroundColor(Color.gray)
                                }
                                
                                HStack {
                                    Rectangle()
                                        .frame(height:1)
                                        .padding(5)
                                }
                                
                                HStack {
                                    
                                    HStack {
                                        Text("Durations")
                                            .foregroundColor(Color.black)
                                            .bold()
                                        Spacer()
                                        Text("12 Weeks")
                                            .foregroundColor(Color.gray)
                                    }
                                    .font(.system(size: 8))
                                    .padding(7)
                                    .background(white)
                                    .cornerRadius(10)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Text("Remaining")
                                            .foregroundColor(Color.black)
                                            .bold()
                                        Spacer()
                                        Text("15 Days")
                                            .foregroundColor(Color.gray)
                                    }
                                    .font(.system(size: 8))
                                    .padding(7)
                                    .background(white)
                                    .cornerRadius(10)
                                    
                                }
                                

                            }
                            .padding()
                            .background(.white)

                        })//Button card
                        .cornerRadius(10)
                        .padding()
                        .shadow(radius: 5)
                        //Close of Card
                        
                        VStack(spacing:-10){
                            
                            HStack {
                                Button(action: {
                                    
                                }, label: {
                                    Image(systemName: "list.triangle")
                                        .font(.system(size: 20, weight: .bold))
                                })
                                Spacer()
                                Button(action: {
                                    
                                }, label: {
                                    Image(systemName: "plus")
                                        .font(.system(size: 20, weight: .bold))
                                })
                            }.padding(25)
                            
                            ScrollView {
                                
                                VStack(spacing:-10){
                                    HStack{
                                        Text("Exercise")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 22.5))
                                            .bold()
                                            .padding()
                                        Spacer()
                                    }
                                    
                                    //Card
                                    CardView(imageCard: "Stars_4", colorCard: purple, milestone: "abla", destinationCard: "")
                                    CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
                                    CardView(imageCard: "Stars_3", colorCard: blue, milestone: "abla", destinationCard: "")
                                    CardView(imageCard: "Stars_1", colorCard: white, milestone: "lol lol abla", destinationCard: "")
                                    CardView(imageCard: "Stars_2", colorCard: white, milestone: "abla", destinationCard: "")
                                    CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
                                    CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
                                    CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
                                    //Close of Card
                                }
                                
                            }
                            
                        } //VStack
                   
                    } //VStack
                    .navigationTitle("Goal")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing){
                            Button(action: {
                                //Do action
                            }, label: {
                                HStack {
                                    Image(systemName: "diamond.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    
                                    Text("27")
                                    Text("Rookie")
                                        .bold()
                                }
                                .padding(5)
                                .font(.system(size: 12.5))
                                .foregroundColor(whiteDark)
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 2)
                            })
                        }
                    } //Toolbar
                    
                }
                
            //}.edgesIgnoringSafeArea(.all)
            
        } //Navigation View
        .edgesIgnoringSafeArea(.all)

        
    } //View Close
    
    //Function
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

//List
//List {
//    ForEach(items) { item in
//        NavigationLink {
//            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//        } label: {
//            Text(item.timestamp!, formatter: itemFormatter)
//        }
//    }
//    .onDelete(perform: deleteItems)
//}
//.toolbar {
//    ToolbarItem(placement: .navigationBarTrailing) {
//        EditButton()
//    }
//    ToolbarItem {
//        Button(action: {self.addNewPlanView.toggle()}) {
//            Label("Add Item", systemImage: "plus")
//                .foregroundColor(Color.blue)
//        }.sheet(isPresented: $addNewPlanView) {
//            AddPlanView()
//        }
//    }
//}
//Text("Select an item")
