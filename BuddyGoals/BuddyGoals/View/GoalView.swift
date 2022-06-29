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
    
    @EnvironmentObject var activityToday : Dailies
    
    
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
                                    Text(activityToday.todaysPlanAction.filter({$0.key.title == "Olahraga"})[0].value.filter({$0.place == "Kompleks"})[0].action)
                                        .font(.system(size: 25, weight: .bold))
                                        .frame(alignment: .topTrailing)
                                        .foregroundColor(Color.black)
//                                    Text(activityToday.goal.plans.filter({$0.title == "Olahraga"})[0].actions.filter({$0.place == "Kompleks"})[0].action)

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
                                        Text("\(activityToday.goal.duration) Weeks")
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
//                                    activityToday.goal.addNewPlan(title: "Tidur")
                                    activityToday.todaysPlanAction[PlanClass(title: "Tidur", actions: [])] = []
                                    let _ = print(activityToday.todaysPlanAction.count)
                                }) {
                                    Image(systemName: "plus")
                                        .font(.system(size: 20, weight: .bold))
                                }
//                                }.sheet(isPresented: $addNewPlanView) {
//                                    AddPlanView()
//                                }
                                
                            }.padding(25)
                            
                            ScrollPlanView()
                            
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
            .environmentObject(Dailies())
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

struct PlanView: View {
    
    var plan : PlanClass
    var planActions : [Actionable]
    
//    init(plan : PlanClass, planAction : [Actionable]) {
//        self.plan = plan
//        self.planActions = planAction
//    }
    
    var body: some View {
        VStack(spacing:-10){
                HStack{
                    Text(plan.title)
                        .foregroundColor(.gray)
                        .font(.system(size: 22.5))
                        .bold()
                        .padding()
                    Spacer()
                }
                let _ = print("AAAAAAA")
                ForEach(planActions) { action in
                    let _ = print("action.action")
                    NavigationLink(destination: AddActionView(action : action, planId: plan.id), label: {
                        CardView(imageCard: "Stars_4", colorCard: purple, milestone: action.action, destinationCard: "")
                    })
    //                Text(action.action)
                }
            
            
            //Card
//            CardView(imageCard: "Stars_4", colorCard: purple, milestone: "abla", destinationCard: "")
//            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
//            CardView(imageCard: "Stars_3", colorCard: blue, milestone: "abla", destinationCard: "")
//            CardView(imageCard: "Stars_1", colorCard: white, milestone: "lol lol abla", destinationCard: "")
//            CardView(imageCard: "Stars_2", colorCard: white, milestone: "abla", destinationCard: "")
//            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
//            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
//            CardView(imageCard: "Stars_5", colorCard: orange, milestone: "lol lol abla", destinationCard: "")
            //Close of Card
        }
    }
}

struct ScrollPlanView: View {
    
    @EnvironmentObject var activityToday : Dailies
    
    var body: some View {
        ScrollView {
            ForEach(Array(activityToday.todaysPlanAction.keys)) { key in
                PlanView(plan: key, planActions: activityToday.todaysPlanAction[key]!)
                ForEach(activityToday.todaysPlanAction[key]!) { action in
                                    Text(action.action)
                                }
                let _ = print("Masuk")
            }
//            ForEach(0..<activityToday.goal.plans.count){ index in
//                PlanView(py<Actionable>)') cannot conform to 'Hashable'lan: activityToday.goal.plans[index], planActions: activityToday.goal.plans[index].actions)
//                ForEach(activityToday.goal.plans[index].actions) { action in
//                    Text(action.action)
//                }
////                    let objectMirror = Mirror(reflecting: action)
////                    let properties = objectMirror.childrenlizer
////
////                    ForEach(Array(properties)) { property in
////
////                      let _ = print("\(property.label!) = \(property.value)")
////
////                    }
////               Text(activityToday.todaysPlanAction.filter({$0.key.title == "Olahraga"})[0].value.filter({$0.place == "Kompleks"})[0].action)
////                Text(activityToday.todaysPlanAction[plan]![0].action)
//            }
        }
    }
}
