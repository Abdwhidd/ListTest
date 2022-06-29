//
//  TodoListManager.swift
//  ListTest
//
//  Created by Wahid on 30/06/22.
//

import Foundation


class TodoListMagager: ObservableObject {
    
    @Published var items: [Item] = []
    
    init(isForTest: Bool = false) {
        if isForTest {
            
        }
    }
    
    // MOVE
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    // ADD ITEM
    func addItem() {
        items.append(Item(id: UUID(), name: "Newly Added"))
    }
    
    // DELETE
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
    // Empty Sate
    static func emptyState() -> TodoListMagager {
        let manager = TodoListMagager(isForTest: true)
        manager.items = []
        return manager
    }
    
    //Full State
    static func fullState() -> TodoListMagager {
        let manager = TodoListMagager(isForTest: true)
        manager.items = [Item(id: UUID(), name: "Wahid"),
                         Item(id: UUID(), name: "Sura"),
                         Item(id: UUID(), name: "Uca")]
        return manager
    }
}
