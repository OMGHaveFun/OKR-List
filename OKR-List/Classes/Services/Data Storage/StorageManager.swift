//
//  Copyright © 2018 Alexander Yalchik. All rights reserved.
//

import RealmSwift

class StorageManager {
  static let shared = StorageManager()
  private var realm: Realm?
  
  private init() {
    do {
      realm = try Realm()
    } catch let error as NSError {
      print(error.description)
      // handle error
    }
  }
}

extension Realm {
  public func safeWrite(_ block: (() throws -> Void)) throws {
    if isInWriteTransaction {
      try block()
    } else {
      try write(block)
    }
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

// MARK: - Game Results !
extension StorageManager {
  
  func store(text: String) {
    guard let realm = realm else {
      print("| Realm | store note: return")
      return }
    
    do {
      try realm.safeWrite {
          let newNote = RLMNote(text: text)
          realm.add(newNote, update: .modified)
      }
    } catch let error as NSError {
      print("| Realm | store note: \(error)")
    }
  }

}

// MARK: - Clear all Realm Storage !
extension StorageManager {
  
  func deleteAll() {
    guard let realm = realm else {
      print("| Realm | deleteAll: return")
      return }
    
    do {
      try realm.safeWrite {
        realm.deleteAll()
      }
      
    } catch let error as NSError {
      print("| Realm | deleteAll: \(error)")
    }
  }
}
