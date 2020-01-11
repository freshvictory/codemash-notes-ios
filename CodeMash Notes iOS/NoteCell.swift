//
//  NoteView.swift
//  CodeMash Notes iOS
//
//  Created by Justin Renjilian on 1/8/20.
//

import SwiftUI

struct NoteCell: View {
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(note.title)
                .fontWeight(.bold)
                .font(.system(size: 20))
            HStack(spacing: 10) {
                Text(note.presenter)
                    .italic()
                    .foregroundColor(.gray)
                Text("•")
                Text("\(note.rating) / 10")
                    .foregroundColor(getRatingColor(rating: note.rating))
            }
            Text(note.notes)
                .lineLimit(nil)
        }
    }
    
    func getRatingColor(rating: Int) -> Color {
        return rating > 7
            ? Color.init(hex: "50b946")
            : rating > 5
                ? Color.init(hex: "fca403")
                : Color.init(hex: "ff0000")
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff


        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)

    }
}

struct NoteCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NoteCell(note: Note(id: 1, title: "SwiftUI", presenter: "Jeff Something", rating: 8, notes: "A good talk"))
            NoteCell(note: Note(id: 2, title: "Four hours of beeping", presenter: "Brandon's alarm clock", rating: 7, notes: "BEEP BEEP BEEP BEEP BEEP BEEP BEEP"))
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
