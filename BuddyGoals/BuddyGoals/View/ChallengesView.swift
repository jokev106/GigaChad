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

    var body: some View {
        
        //Try to make card
        VStack {
            
            ZStack {
                Color("blueUIColor")
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 130)
                                
                VStack{
                    ZStack {
                        Text("Let’s keep it up! ")
                            .font(.system(size: 18, design: .default))
                            .padding(10)
                                                
                        Button(action: {
                            //do action
                        }, label: {
                            Text("Edit")
                                .font(.system(size: 13))
                        })
                        .padding(5)
                        .background(Color("grayButton"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Text("Lose 10 kg in 3 months")
                        .font(.system(size: 21, weight: .bold, design: .default))
                        .border(Color("blueUIColor"))
                        .padding(10)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                }
                .frame(width: 350)
                .background(.white)
                .shadow(radius: 20)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
        }
        //close
            
            NavigationView {
                
                List {
                    ForEach(items) { item in
                        NavigationLink {
                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                        } label: {
                            Text(item.timestamp!, formatter: itemFormatter)
                        }
                    }
                    .onDelete(perform: deleteItems)

                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                Text("Select an item")
                
                
            }
            
        }
        
    }

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

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
