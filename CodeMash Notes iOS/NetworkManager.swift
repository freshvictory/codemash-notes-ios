//
//  NetworkManager.swift
//  CodeMash Notes iOS
//
//  Created by Justin Renjilian on 1/9/20.
//

import Combine
import SwiftUI

class NetworkManager: ObservableObject {    
    @Published var notes = [Note]()
    
    func load() {
      guard let url = URL(string: "https://swift-notes-api.herokuapp.com/api/notes") else { return }
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        do {
            guard let data = data else { return }
            let notes = try JSONDecoder().decode(Notes.self, from: data)
            DispatchQueue.main.async {
              self.notes = notes
            }
        } catch {
            print("Failed to decode: ", error)
        }
      }.resume()
    }
}
