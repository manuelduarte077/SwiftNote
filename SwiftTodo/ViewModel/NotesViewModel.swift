//
//  NotesViewModel.swift
//  SwiftTodo
//
//  Created by Manuel Duarte on 2/5/22.
//

import Foundation


class NotesViewModel: ObservableObject {
  @Published var notes: [NoteModel] = []
  
  init(){
    notes = getAllNotes()
  }
  
  func saveNote (description: String){
    let newNote = NoteModel(description: description)
    notes.insert(newNote, at: 0)
    encodeAndSaveAllNotes()
  }
    
  private func encodeAndSaveAllNotes() {
    if let ecoded = try? JSONEncoder().encode(notes) {
      UserDefaults.standard.set(ecoded, forKey: "notes")
    }
  }
  
  func getAllNotes () -> [NoteModel] {
    
    if let notesData = UserDefaults.standard.object(forKey: "notes") as? Data {
      
      if let notes = try? JSONDecoder().decode([NoteModel].self, from: notesData) {
        return notes
      }
      
    }
    
    return []
    
  }

}
