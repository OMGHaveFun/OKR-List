//
//  Copyright © 2018 Alexander Yalchik. All rights reserved.
//

import ObjectMapper

class User: Mappable {

    var firstName: String?
    var lastName: String?
    var phone: String?

    init(firstName: String?, lastName: String?, phone: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
    }

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        phone <- map["phone"]

    }
}
