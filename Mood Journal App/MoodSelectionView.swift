//
//  MoodSelectionView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//
// Mood selection screen
// Allows a user to select a mood with the tap of a button

import SwiftUI

struct MoodSelectionView: View{
    @EnvironmentObject var moodData: MoodData // Access shared data

    // List of available moods
    let moods = ["😀", "🙁", "😡", "😐", "😴"]
    
    var body: some View {
        
        VStack(spacing: 15) {
            
            Text("Pick today's mood")
                .font(.title)
            // Displays buttons for each available mood
            ForEach(moods, id: \.self){ mood in
                Button(action: {
                    // Stores selected mood as a new entry
                    let newMood = MoodEntry(mood: mood)
                    moodData.dataEntries.insert(newMood, at: 0)
                }) {
                    Text(mood)
                        .font(.system(size: 40))
                        .padding()
                }
            }
            Spacer()
        }
        .padding([.top], 50)
        .navigationTitle("Select Mood")
    }
}


#Preview {
    MoodSelectionView()
        .environmentObject(MoodData())
}
