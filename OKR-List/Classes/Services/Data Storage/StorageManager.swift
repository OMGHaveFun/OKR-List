//
//  Copyright © 2018 Alexander Yalchik. All rights reserved.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    private init() {
    }
}

extension StorageManager {

    static func configureMigration() {

        let config = Realm.Configuration(
            schemaVersion: 0,

            migrationBlock: { migration, oldSchemaVersion in

                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
        })

        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }

}

extension StorageManager {

    // MARK: - Current User

//    func store(currentUser: UserResponse) {
//        let realm = try! Realm()
//
//        let newCurrentUser = RGUser(userInfo: currentUser)
//        try! realm.write {
//            realm.add(newCurrentUser, update: true)
//        }
//    }
//
//    func storedUser() -> RGUser? {
//        let realm = try! Realm()
//        return realm.objects(RGUser.self).first
//    }
//
//    func userID() -> Int {
//        let realm = try! Realm()
//        return (realm.objects(RGUser.self).first?.userID)!
//    }

}

extension StorageManager {

    // MARK: - Clear all Realm Storage

    func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
