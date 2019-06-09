//
//  NotesTableViewCell.swift
//  QuickNotesApp
//
//  Created by Jordan Spell on 6/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//delegate steps
//1. create a protocol
//2. weak var delegate of protocol type
//3. assign the delegate

protocol NoteTableViewCellDelegate: class {
    func shareNote(for cell: NotesTableViewCell)
}

class NotesTableViewCell: UITableViewCell {
    //Mark - Properties and Outlets
    @IBOutlet weak var noteLabel: UILabel!
    weak var delegate: NoteTableViewCellDelegate?
    
    var note: Note? {
        didSet {
            updateViews()
        }
    }
    
    //Mark - IBActions
    @IBAction func ShareButtonTapped(_ sender: Any) {
        self.delegate?.shareNote(for: self)
    }
    
    private func updateViews() {
        guard let note = note else { return }
        noteLabel.text = note.text
    }

}
