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
            Text("Time:")
            Text(entry.date, style: .time)

            ForEach(entry.items) { item in
                Button(intent: ToggleFavoriteIntent(itemID: item.id)) {
                    Text("Is Toggled? \(item.completed ? "true" : "false")")
                }
            }
        }
    }
}
