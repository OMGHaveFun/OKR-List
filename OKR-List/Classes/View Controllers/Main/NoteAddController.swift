//
//  NoteAddController.swift
//  OKR-List
//
//  Created by Alexander Yalchik on 10/1/19.
//  Copyright © 2019 Alexander Yalchik. All rights reserved.
//

import UIKit

class NoteAddController: BaseViewController {

    @IBOutlet weak var textView: UITextView!
    var placeholderLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter some text..."
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty

    }

    @IBAction func noteAddPressed(_ sender: UIButton) {
        guard let text = textView.text else { return }

        StorageManager.shared.store(text: text)
        navigationController?.popViewController(animated: true)
    }

}

extension NoteAddController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }

}
