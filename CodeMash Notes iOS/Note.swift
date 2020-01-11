//
//  Note.swift
//  CodeMash Notes iOS
//
//  Created by Justin Renjilian on 1/8/20.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: Int
    var title: String
    var presenter: String
    var rating: Int
    var notes: String
}

typealias Notes = [Note]
