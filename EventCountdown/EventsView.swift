//
//  EventsView.swift
//  EventCountdown
//
//  Created by Natanael Jop on 20/11/2024.
//

import SwiftUI

struct EventsView: View {
    let events: [Event]
    var delete: (IndexSet) -> Void
    var onEdit: (Event) -> Void
    var body: some View {
        List {
            ForEach(events.sorted()) { event in
                NavigationLink {
                    EventForm(event: event) { finalEvent in
                        onEdit(finalEvent)
                    }
                } label: {
                    EventRow(event: event)
                }
            }.onDelete(perform: delete)
        }
    }
}

#Preview {
    ContentView(events: [Event(title: "Halloween", date: Date().addingTimeInterval(10000), textColor: .yellow)])
}
