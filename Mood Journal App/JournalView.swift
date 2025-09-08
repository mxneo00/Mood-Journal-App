//
//  JournalView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//
// Add support to log multiple days of entries
// Add support to delete entries


//import Foundation
import SwiftUI

struct JournalView: View {
    @EnvironmentObject var moodData: MoodData
    
    var body: some View {
        List(moodData.dataEntries) { entry in
            NavigationLink {
                MoodDetailView(entry: entry)
            } label: {
                HStack {
                    Text(entry.mood).font(.system(size: 30))
                    Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                }
            }
        }
        .navigationTitle("Journal")
    }
}

#Preview {
    JournalView()
        .environmentObject(MoodData())
}
