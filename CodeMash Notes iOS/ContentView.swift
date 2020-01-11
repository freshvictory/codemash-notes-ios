//
//  ContentView.swift
//  CodeMash Notes iOS
//
//  Created by Justin Renjilian on 1/8/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var networkManager: NetworkManager
    
    var notes = [
        Note(id: 1, title: "Slightly Swelling", presenter: "Bob Govia", rating: 10, notes: "Made precompilers worth it"),
        Note(id: 2, title: "Four hours of beeping", presenter: "Brandon's alarm clock", rating: 7, notes: "BEEP BEEP BEEP BEEP BEEP BEEP BEEP"),
        Note(id: 3, title: "Two bears and a chick", presenter: "Rilakkuma and Kaoru", rating: 10, notes: "They burned pancakes and tried to shoo away a frog")
    ]
    
    var body: some View {
        NavigationView {
            List(networkManager.notes) { note in
                NoteCell(note: note)
            }
            .navigationBarTitle("CodeMash Notes")
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    self.networkManager.load()
                }, label: {
                    Image(systemName: "arrow.2.circlepath")
                })
            })
            .onAppear {
                self.networkManager.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NetworkManager())
    }
}
