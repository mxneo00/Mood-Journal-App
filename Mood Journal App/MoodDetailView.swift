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
            VStack(spacing: 10) {
                Text(entry.mood).font(.title)
                Text(entry.date.formatted(date: .abbreviated, time: .omitted))
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
