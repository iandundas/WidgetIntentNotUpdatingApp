//
//  Item.swift
//  TapTapTest
//
//  Created by Ian Dundas on 20/09/2023.
//

import Foundation
import RealmSwift

//@Model
//final class Item {
//    var id: String
//    var timestamp: Date
//    var completed: Bool
//
//    init(id: String, timestamp: Date, completed: Bool) {
//        self.id = id
//        self.timestamp = timestamp
//        self.completed = completed
//    }
//}

final class Item: Object, ObjectKeyIdentifiable {
    @Persisted var completed: Bool = false

    // MARK: - bookkeeping:
    @Persisted(primaryKey: true) var _id: ObjectId // ??
}
