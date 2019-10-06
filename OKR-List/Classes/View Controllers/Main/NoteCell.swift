//
//  Copyright © 2019 Marina Yalchik. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    var noteData: RLMNote? { didSet { setupCell() } }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setupCell() {
        self.textLabel?.text = noteData?.text
    }

}
