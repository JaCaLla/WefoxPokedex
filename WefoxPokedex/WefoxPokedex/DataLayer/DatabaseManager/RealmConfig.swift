//
//  RealmConfig.swift
//  Barista
//
//  Created by 08APO0516 on 21/08/2018.
//  Copyright © 2018 Nestlé DSU. All rights reserved.
//

import Foundation
import RealmSwift

struct DBFilename {
    static let secured = "secured.realm"
    static let regular = "default.realm"
}

enum RealmConfig {

    // MARK: - private configurations
    private static let mainConfig = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 0,

        // Set the block which will be called automatically when opening a Realm with
        // a schema version lower than the one set above
        migrationBlock: { _, _ in
            // All migration code will be placed here
        }
    )

    private static let utestConfig = Realm.Configuration(fileURL: nil,
                                                         inMemoryIdentifier: "test",
                                                         syncConfiguration: nil,
                                                         encryptionKey: nil,
                                                         readOnly: false,
                                                         schemaVersion: 0,
                                                         migrationBlock: nil,
                                                         deleteRealmIfMigrationNeeded: true,
                                                         objectTypes: nil)


    // MARK: - enum cases
    case main
    case utest

    // MARK: - current configuration
    var configuration: Realm.Configuration {
        switch self {
        case .main:
            return RealmConfig.mainConfig
        case .utest:
            return RealmConfig.utestConfig
        }
    }

}

extension URL {

    // returns an absolute URL to the desired file in documents folder
    static func inDocumentsFolder(fileName: String) -> URL {
        return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
            .appendingPathComponent(fileName)
    }
}
