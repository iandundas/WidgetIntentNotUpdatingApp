//
//  ToggleIntent.swift
//  MyWidgetExtension
//
//  Created by Ian Dundas on 20/09/2023.
//

import AppIntents
import SwiftData

struct ToggleFavoriteIntent: AppIntent {

    static var title: LocalizedStringResource = "Toggle Fav Intent"
    static var description: IntentDescription? = "Description"

    @Parameter(title: "Item ID")
    var itemID: String

    init() {
        itemID = ""
    }

    init(itemID: String){
        self.itemID = itemID
    }

    @MainActor
    func perform() async throws -> some IntentResult {

        let schema = Schema([Item.self])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            allowsSave: true,
            groupContainer: ModelConfiguration.GroupContainer.identifier("group.solidred.debugging")
        )

        guard let modelContainer = try? ModelContainer(for: schema, configurations: [modelConfiguration]) else {
            return .result()
        }

        let descriptor = FetchDescriptor<Item>(predicate: #Predicate { item in
            item.id == itemID
        })

        let context = modelContainer.mainContext
        let items = try! context.fetch(descriptor)

        if let item = items.first {
            item.completed.toggle()
            try! context.save()
        }

        return .result()
    }
}
