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
  
  override func viewDidLoad() {
        super.viewDidLoad()

    }

  @IBAction func noteAddPressed(_ sender: UIButton) {
    guard let text = textView.text else { return }
    
    StorageManager.shared.store(text: text)
  }
  
}
