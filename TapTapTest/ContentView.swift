//
//  ContentView.swift
//  TapTapTest
//
//  Created by Ian Dundas on 20/09/2023.
//

import SwiftUI
import SwiftData
import WidgetKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.scenePhase) private var phase
    @Query private var items: [Item]

    var body: some View {
        List {
            ForEach(items) { item in
                Button {
                    item.completed.toggle()
                    try! modelContext.save()
                } label: {
                    Text("Tap to toggle: \(item.completed ? "true" : "false")")
                }
            }
        }
        .onChange(of: phase) {
            WidgetCenter.shared.reloadAllTimelines()
        }
        .onAppear() {

            // Insert an Item if DB is empty:
            if try! modelContext.fetch(FetchDescriptor<Item>()).isEmpty {
                let newItem = Item(id: UUID().uuidString, timestamp: Date(), completed: false)
                modelContext.insert(newItem)

                try! modelContext.save()

                WidgetCenter.shared.reloadAllTimelines()
            }
        }
    }

}
