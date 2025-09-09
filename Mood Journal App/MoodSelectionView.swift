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
        
        VStack(spacing: 15) {
            
            Text("Pick today's mood")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            ForEach(moods, id: \.self){ mood in
                Button(action: {
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
