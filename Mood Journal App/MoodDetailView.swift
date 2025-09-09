//
//  MoodDetailView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//

import Foundation
import SwiftUI

struct MoodDetailView: View{
    @Binding var entry: MoodEntry
    
    var body: some View {
            VStack(spacing: 50) {
                Text(entry.mood)
                    .font(.system(size: 60))
                
                Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 30))
                
                // Add option to add notes
                TextField("Note", text: $entry.note)
                    .padding(.horizontal)
                    .font(.system(size: 24))
                
                Spacer()
            }
            .navigationTitle("Mood Details")
            .padding([.top], 20)
    }
}

#Preview {
    MoodDetailView(entry: .constant(MoodEntry(mood: "😀", note: "Feeling happy")))
}
