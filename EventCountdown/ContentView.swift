//
//  ContentView.swift
//  EventCountdown
//
//  Created by Natanael Jop on 20/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State var events = [Event]()
    var body: some View {
        NavigationStack {
            ZStack {
                if events.isEmpty {
                    ContentUnavailableView("No events", systemImage: "questionmark")
                }else{
                    EventsView(events: events, delete: {
                        events.remove(atOffsets: $0)
                    }, onEdit: { finalEvent in
                        if let idx = events.firstIndex(where: {$0.id == finalEvent.id }) {
                            events[idx] = finalEvent
                            print("powinno działać")
                        }else{
                            print(events.map({$0.id}))
                            print(finalEvent.id)
                            print("dupa")
                        }
                    })
                }
            }
            .navigationTitle("Events")
            .toolbar {
                NavigationLink {
                    EventForm() { finalEvent in
                        events.append(finalEvent)
                    }
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

#Preview {
    ContentView(events: [Event(title: "Halloween", date: Date().addingTimeInterval(10000), textColor: .yellow)])
}
