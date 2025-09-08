//
//  MoodSelectionView.swift
//  Mood Journal App
//
//  Created by Katellyn Hyker on 9/4/25.
//

import Foundation
import SwiftUI

struct MoodSelectionView: View{
    @EnvironmentObject var moodData: MoodData
    
    let moods = ["😀", "🙁", "😡", "😐", "😴"]
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Pick todays mood")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            ForEach(moods, id: \.self){ mood in
                Text(mood)
                    .font(.system(size: 24))
                    .onTapGesture {
                    let newMood = MoodEntry(mood: mood)
                    moodData.dataEntries.insert(newMood, at: 0)
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Select Mood")
    }
}


#Preview {
    MoodSelectionView()
        .environmentObject(MoodData())
}
