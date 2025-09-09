//
//  JournalView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//
// Add support to log multiple days of entries

import SwiftUI

struct JournalView: View {
    @EnvironmentObject var moodData: MoodData // Access shared data
    
    var body: some View {

        // Create and display a list of all mood entries
        List() {
            // Binding so edits are updated directly
            ForEach($moodData.dataEntries) { $entry in

                NavigationLink {
                    // Send binding to the MoodDetailView
                    MoodDetailView(entry: $entry)
                    
                } label: {
                    
                    HStack {
                        
                        Text(entry.mood).font(.system(size: 30))
                        
                        Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                    }
                }
            }
            .onDelete(perform: deleteEntry) // Allow for entries to be deleted
        }
        .navigationTitle("Journal")
    }

    // Remove deleted entries from stored data
    private func deleteEntry(at offsets: IndexSet){
        moodData.dataEntries.remove(atOffsets: offsets)
    }
}


#Preview {
    JournalView()
        .environmentObject(MoodData())
}
