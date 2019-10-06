//
//  Copyright © 2019 Marina Yalchik. All rights reserved.
//

import UIKit

struct AlertHelper {

    static func showDeleteNoteAlert(completion:@escaping() -> Void) {

        let alert = UIAlertController(title: "",
                                      message: "Действительно удалить заметку?",
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: AlertStrings.cancel, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: AlertStrings.okay, style: .default, handler: { (_ action) in
            completion() }))

        UIApplication.shared.topViewController?.present(alert, animated: true, completion: nil)
    }

}
