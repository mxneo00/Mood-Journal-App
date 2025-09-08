//
//  JournalView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//

import Foundation
import SwiftUI

struct JournalView: View {
    @ObservedObject var moodData: MoodData
    
    var body: some View {
        List(moodData.dataEntries) { entry in
            NavigationLink {
                MoodDetailView(entry: entry)
            } label: {
                HStack {
                    Text(entry.mood).font(.title)
                    Text(entry.date.formatted(date: .abbreviated, time: .omitted))
                }
            }
        }
        .navigationTitle("Journal")
    }
}

#Preview {
    JournalView(moodData: MoodData())
}
