//
//  ContentView.swift
//  SwiftTodo
//
//  Created by Manuel Duarte on 1/5/22.
//

import SwiftUI

struct ContentView: View {
  
  @State var descriptionNote: String = ""
  
  // Vamos crear una instancia del ViewModel
  @StateObject var notesViewModel = NotesViewModel()
  
  
  var body: some View {
    NavigationView {
      VStack {
        TextEditor(text: $descriptionNote)
          .foregroundColor(.gray)
          .padding(.horizontal, 10)
          .frame(height: 60)
          .overlay(
            RoundedRectangle(cornerRadius: 8)
              .stroke(.green, lineWidth: 2)
          )
          .padding( 22)
          .cornerRadius(3.0)
        Button{
          notesViewModel.saveNote(description: descriptionNote)
          descriptionNote = ""
        } label: {
          Text("Create")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding()
            .background(Color.green.opacity(0.7))
            .cornerRadius(5)
            .shadow(radius: 5)
        }
        
        Spacer()
        List{
          // Aca madamos a llamar a todas las notas
          ForEach(notesViewModel.notes, id: \.id){ note in
            HStack {
              Text(note.description)
                .font(.body)
            }
          }
        }
      }
      .navigationTitle("TODO")
      .navigationBarTitleDisplayMode(.large)
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
