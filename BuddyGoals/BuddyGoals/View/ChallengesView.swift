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
        
        ZStack {
            Color(.white)
            VStack {
                blueGiga
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 90)
               
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
                } //Navigation
                .padding(.top, 40)

            }
            
            VStack {
                Text("Hi Giga! ")
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Lose 10 kg in 3 months")
                    .font(.system(size: 21, weight: .bold, design: .default))
                    //.border(Color("blueUIColor"))
                    .padding(10)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxWidth: .infinity)
            }
            .frame(width: 350)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .position(x: 195, y: 75)
            
        } //ZSTACK
        
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
