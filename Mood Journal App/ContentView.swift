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
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(moodData.todaysMood?.mood ?? "😐")
                    .font(.system(size: 30))
                
                NavigationLink("Select mood", destination: MoodSelectionView())
                
                NavigationLink("Journal", destination: JournalView())
                
                //Fix to account for new note feature
                // Error message: Cannot convert value of type 'MoodEntry?' to expected argument type 'Binding<MoodEntry>
                NavigationLink("Mood Details", destination: MoodDetailView(entry: moodData.todaysMood))
            }
            .navigationTitle("Mood Journal")
        }
        .environmentObject(moodData)
        .padding()
    }
}

struct MoodEntry: Identifiable {
    let id = UUID()
    let mood: String
    let date = Date()
    var note: String = ""
}

class MoodData: ObservableObject {
    @Published var dataEntries: [MoodEntry] = []
    
    var todaysMood: MoodEntry? {
        dataEntries.first{Calendar.current.isDateInToday($0.date)}
    }
    
    
}

#Preview {
    ContentView()
}
