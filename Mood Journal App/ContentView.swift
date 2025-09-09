//
//  ContentView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//
// Main Page: Display's today's mood and navigation to alternative pages

import SwiftUI

struct ContentView: View {
    @StateObject var moodData = MoodData() // Shared state for moods
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Todays Mood:")
                    .font(.title)

                // Show todays mood emoji or a placeholder if a mood has not been selected
                Text(moodData.todaysMood?.mood ?? "😐")
                    .font(.system(size: 30))

                // Navigate to SelectMoodView
                NavigationLink("Select mood", destination: MoodSelectionView())

                // Navigate to JournalView
                NavigationLink("Journal", destination: JournalView())

                // Navigate to MoodDetailsView
                // Only interactable when a mood has been selected for the day
                if let todaysIndex = moodData.dataEntries.firstIndex(where: {
                    Calendar.current.isDateInToday($0.date)
                }) {
                    NavigationLink("Mood Details") {
                        MoodDetailView(entry: $moodData.dataEntries[todaysIndex])
                    }
                } else {
                    NavigationLink("Mood Details") {
                        Text("No entry")
                    }
                    .disabled(true)
                }
            }
            .navigationTitle("Mood Journal")
        }
        .environmentObject(moodData) // Passes shared data to other views
        .padding()
    }
}

// Single mood entry variables
struct MoodEntry: Identifiable {
    let id = UUID()
    let mood: String
    let date = Date()
    var note: String = ""
}

// Observable to store all entries
class MoodData: ObservableObject {
    @Published var dataEntries: [MoodEntry] = []
    
    var todaysMood: MoodEntry? {
        dataEntries.first{Calendar.current.isDateInToday($0.date)}
    }
    
}

#Preview {
    ContentView()
}
