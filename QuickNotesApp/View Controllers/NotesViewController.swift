//
//  NotesViewController.swift
//  QuickNotesApp
//
//  Created by Jordan Spell on 6/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    //Mark: - Outlets and Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var NotesTextView: UITextView!
    
    let noteController = NoteController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Mark: - IBActions and Methods
    @IBAction func SaveButtonTapped(_ sender: Any) {
        guard let text = NotesTextView.text else { return }
        noteController.createNote(withText: text)
        
        tableView.reloadData()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NotesViewController: UITableViewDelegate {
    
}

extension NotesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
            as? NotesTableViewCell else { return UITableViewCell() }
        
        let note = noteController.notes[indexPath.row]
        
        cell.note = note
        cell.delegate = self
        return cell
    }
    
    
}

extension NotesViewController: NoteTableViewCellDelegate {
    func shareNote(for cell: NotesTableViewCell) {
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        
        self.present(activityController, animated: true, completion: nil)
    }
    
    
}

/* Delegator View
    1. create protocol
    2. add properties and methods to protocol
    3. in delegator class, create (weak var delegate) property of type [Protocol]
    4. in IBAction call self.delegate.[insert method name here]
 
  Delegate View
    1. adopt the protocol
    2. assign the delegate when initializing the delegator view
    3. add protocol stubs
    4. add code in delegate method that you want the delegate to complete
 */
