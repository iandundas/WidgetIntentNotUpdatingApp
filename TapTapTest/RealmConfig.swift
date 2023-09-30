//
//  RealmConfig.swift
//  TapTapTest
//
//  Created by Ian Dundas on 30/09/2023.
//

import Foundation
import RealmSwift

extension Realm.Configuration {
    public static var ian: Realm.Configuration {
        Realm.Configuration(fileURL: {
            let appGroupIdentifier = "group.solidred.debugging"
            if let groupContainerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier) {
                print("Group Container URL: \(groupContainerURL)")
                let path = groupContainerURL.appending(path: "realm")
                print("Path: \(path)")
                return path
            } else {
                fatalError("Failed to get the group container URL")
            }
        }())
    }
}
