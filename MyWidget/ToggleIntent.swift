//
//  ToggleIntent.swift
//  MyWidgetExtension
//
//  Created by Ian Dundas on 20/09/2023.
//

import AppIntents
import RealmSwift

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

        let realm = try await Realm(configuration: .ian)
        let items = realm.objects(Item.self).first

        if let item = items {
            try realm.write {
                item.completed.toggle()
            } 
        }

        return .result()
    }
}
