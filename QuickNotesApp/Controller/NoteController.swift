//
//  NoteController.swift
//  QuickNotesApp
//
//  Created by Jordan Spell on 6/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class NoteController {
    private(set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        let note = Note(text: text)
        notes.append(note)
    }
}
