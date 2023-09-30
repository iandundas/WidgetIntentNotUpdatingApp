//
//  MyWidgetEntryView.swift
//  MyWidgetExtension
//
//  Created by Ian Dundas on 21/09/2023.
//

import SwiftUI

struct MyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            if entry.items.isEmpty {
                Text("empty")
            }
            ForEach(entry.items) { item in
                Button(intent: ToggleFavoriteIntent()) {
                    Text("Is Toggled? \(item.completed ? "true" : "false")")
                }
            }
        }
    }
}
