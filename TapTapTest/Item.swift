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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
