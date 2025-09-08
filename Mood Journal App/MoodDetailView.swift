//
//  MoodDetailView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//

import Foundation
import SwiftUI

struct MoodDetailView: View{
    let entry: MoodEntry?
    
    var body: some View {
        if let entry = entry {
            VStack(spacing: 30) {
                Text(entry.mood)
                    .font(.system(size: 60))
                Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 24))
                // Add option to add notes
            }
            .navigationTitle("Mood Details")
        } else {
            Text("No mood selected today")
        }
    }
}

#Preview {
    MoodDetailView(entry: MoodEntry(mood: "😀"))
}
