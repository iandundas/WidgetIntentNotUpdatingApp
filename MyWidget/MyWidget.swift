//
//  MyWidget.swift
//  MyWidget
//
//  Created by Ian Dundas on 20/09/2023.
//

import WidgetKit
import SwiftUI
import SwiftData

struct SimpleEntry: TimelineEntry {
    let date: Date
    let items: [Item]
}

struct Provider: TimelineProvider {
    @MainActor func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), items: getItems())
    }

    @MainActor func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), items: getItems())
        completion(entry)
    }

    @MainActor func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let timeline = Timeline(
            entries: [SimpleEntry(date: .now, items: getItems())],
            policy: .after(.now.addingTimeInterval(60*5))
        )
        completion(timeline)
    }

    @MainActor
    func getItems() -> [Item] {
        guard let modelContainer = try? ModelContainer(for: Item.self) else {
            return []
        }

        let items = try? modelContainer.mainContext.fetch(FetchDescriptor<Item>())
        return items ?? []
    }
}

struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
