//
//  ContentView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var moodData = MoodData()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Todays Mood:")
                Text(moodData.todaysMood?.mood ?? "😐")
                
                NavigationLink("Select mood", destination: MoodSelectionView())
                
                NavigationLink("Journal", destination: JournalView())
                
                NavigationLink("Mood Details", destination: MoodDetailView())
            }
        }
        .padding()
    }
}

struct Data: Identifiable {
    let id = UUID()
    let mood: String
    let date = Date()
}

class MoodData: ObservableObject{
    @Published var dataEntries: [Data] = []
    
    var todaysMood: Data? {
        dataEntries.first{Calendar.current.isDateInToday($0.date)}
    }
    
    
}

#Preview {
    ContentView()
}
