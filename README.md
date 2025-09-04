# Week 1 Lab - Mood Journal App (Multi-Screen)

## Learning Objectives

By completing this lab, students will: Build a multi-screen SwiftUI app (3-4 views). Use @State and @Binding for local/shared state. Learn when to pass data down versus shared globally.
Apply NavigationView and NavigationLink. Add lists and conditional rendering. Build a small but functional journaling app.

## Lab Overview

Students will create a Mood Journal app with the following screens: Home Screen: Shows today's selected mood, buttons for selecting mood and viewing journal.
Mood Selection Screen: Choose an emoji mood, updates today's mood and journal. Journal Screen: Displays a list of past moods (date + emoji)
Mood Detail Screen: Shows details of a single entry (date + emoji , optional note)

## Step-By-Step

### 1. Set Up Project
Create Xcode project -> iOS app -> MoodJournal -> SwiftUI

### 2. Home Screen
Show today's mood or placeholder. Add NavigationLinks for MoodSelectionView and JournalView.

### 3. Mood selection screen
Pick emoji mood -> update today's mood and append entry to journal

### 4. Journal Screen
Display a list of moods with date, use NavigationLink to MoodDetailView

### 5. Mood detail screen
Display a single mood entry with date and emoji. Optionally allow note entry

## Stretch Goals

Add a TextField in MoodDetailView for journaling notes. Store entries persistently with @AppStorage or UserDefaults. Add colors that change with mood. 
Support multiple days, avoiding duplicate entries for the same date.
