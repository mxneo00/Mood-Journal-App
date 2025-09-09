//
//  MoodDetailView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//

import SwiftUI

struct MoodDetailView: View{
    @Binding var entry: MoodEntry // Allows for edits to update stored data

    // Dictionary to connect specific colors to each mood
    let moodColors: [String: Color] = [
        "😀": .yellow.opacity(0.5),
        "🙁": .blue.opacity(0.5),
        "😡": .red.opacity(0.5),
        "😐": .gray.opacity(0.5),
        "😴": .purple.opacity(0.5)
    ]
    
    var body: some View {
        
            VStack(spacing: 50) {
                // Display Emoji
                Text(entry.mood)
                    .font(.system(size: 60))
                // Displays entry date
                Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 30))
                // Ability to write notes
                TextField("Note", text: $entry.note)
                    .padding(.horizontal)
                    .font(.system(size: 24))
                
                Spacer()
            }
            .navigationTitle("Mood Details")
            .padding([.top], 20)
            .background((moodColors[entry.mood] ?? .white)) // Background changes based on mood selection or defaults to white background
    }
}

#Preview {
    MoodDetailView(entry: .constant(MoodEntry(mood: "😀", note: "Feeling happy")))
}
