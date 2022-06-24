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
            
            ZStack{
                primary900
                    .frame(height: 300, alignment: .top)
                    .ignoresSafeArea(.all)
                Spacer()
                
                VStack {
                    
                } //VStack
                
            } //ZStack
            
        }//NavigationView
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
