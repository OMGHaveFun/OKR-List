//
//  ViewController.swift
//  OKR-List
//
//  Created by Alexander Yalchik on 10/31/18.
//  Copyright © 2018 Alexander Yalchik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var noteItems: [RLMNote] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        updateData()
    }

    private func updateData() {
        noteItems = StorageManager.shared.notes()
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCell
        let note = noteItems[indexPath.row]
        cell.noteData = note

        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AlertHelper.showDeleteNoteAlert {
                let note = self.noteItems[indexPath.row]
                StorageManager.shared.deleteNote(note: note)
                self.noteItems = StorageManager.shared.notes()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}

