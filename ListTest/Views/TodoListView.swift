//
//  ContentView.swift
//  ListTest
//
//  Created by Wahid on 29/06/22.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var todoManager = TodoListMagager()
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todoManager.items) { item in
                        NavigationLink(
                            destination: Text("Destination \(item.name)"), label: {
                                Text(item.name)
                            })
                    }
                    .onDelete(perform: { indexSet in
                        todoManager.delete(at: indexSet)
                    })
                    
                    .onMove(perform: { indices, newOffset in
                        todoManager.move(indices: indices, newOffset: newOffset)
                    })
                }
                
                if todoManager.items.count == 0 {
                    Text("Please, start by adding items")
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle(Text("Todo's"), displayMode: .large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    
                    Button(action: {
                        todoManager.addItem()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoManager: TodoListMagager.emptyState())
            .previewDisplayName("empty state")
        TodoListView(todoManager: TodoListMagager.fullState())
            .previewDisplayName("data exists")
    }
}
