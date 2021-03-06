//
//  Grid.swift
//  Memorize
//
//  Created by Illya Sirosh on 20.01.2021.
//

import SwiftUI

struct Grid<Item: Identifiable, ItemView: View>: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    private var itemRatio: Double
     
    init(_ items: [Item], itemRatio: Double = 1, viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
        self.itemRatio = itemRatio
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: items.count, nearAspectRatio: itemRatio, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        guard let index = self.items.firstIndex(of: item) else {
            return AnyView(EmptyView())
        }
        
        return AnyView(viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index)))
    }

} 
