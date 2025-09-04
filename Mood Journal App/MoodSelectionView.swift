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
        VStack {
            Text("Pick todays mood")
            
            ForEach(moods, id: \.self){ mood in
                Text(mood).onTapGesture {
                    let newMood = Data(mood: mood)
                    moodData.dataEntries.insert(newMood, at: 0)
                }
            }
            Spacer()
        }
        .padding()
    }
}


#Preview {
    MoodSelectionView()
}
