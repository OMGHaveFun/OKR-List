//
//  Copyright © 2019 Alexander Yalchik. All rights reserved.
//

import RealmSwift

class RLMNote: Object {
  
  @objc dynamic var ident = 0
  @objc dynamic var text = ""
  
  convenience init(text: String) {
    self.init()

    self.ident = incrementID()
    self.text = text
  }
  
  override static func primaryKey() -> String? {
    return "ident"
  }
  
  func incrementID() -> Int {
    let realm = try! Realm()
    return (realm.objects(RLMNote.self).max(ofProperty: "ident") as Int? ?? 0) + 1
  }
  
}
