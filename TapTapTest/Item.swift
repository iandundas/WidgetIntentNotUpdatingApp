//
//  Item.swift
//  TapTapTest
//
//  Created by Ian Dundas on 20/09/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: String
    var timestamp: Date
    var completed: Bool

    init(id: String, timestamp: Date, completed: Bool) {
        self.id = id
        self.timestamp = timestamp
        self.completed = completed
    }
}
