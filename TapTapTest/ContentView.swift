//
//  ContentView.swift
//  TapTapTest
//
//  Created by Ian Dundas on 20/09/2023.
//

import SwiftUI
import RealmSwift
import WidgetKit

struct ContentView: View {
    @Environment(\.scenePhase) private var phase
    @Environment(\.realmConfiguration) private var realmConfiguration
    @ObservedResults(Item.self) private var items

    var body: some View {
        List {
            Text("Hello")
            ForEach(items) { item in
                Button {
                    let realm = try! Realm(configuration: realmConfiguration)
                    try! realm.write {
                        item.thaw()?.completed.toggle()
                    }
                    // try! modelContext.save()
                } label: {
                    Text("Tap to toggle: \(item.completed ? "true" : "false")")
                }
            }
        }
        .onChange(of: phase) {
            WidgetCenter.shared.reloadAllTimelines()
        }
        .onAppear() {

            if items.isEmpty {
                $items.append(Item())
            }
//            // Insert an Item if DB is empty:
//            if try! modelContext.fetch(FetchDescriptor<Item>()).isEmpty {
//                let newItem = Item(id: UUID().uuidString, timestamp: Date(), completed: false)
//                modelContext.insert(newItem)
//
//                try! modelContext.save()

                WidgetCenter.shared.reloadAllTimelines()
//            }
        }
    }

}
