//
//  EventRow.swift
//  EventCountdown
//
//  Created by Natanael Jop on 20/11/2024.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    @State var currentDate = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    var properDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
            
        return formatter.localizedString(for: event.date, relativeTo: currentDate)
    }
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(event.title)
                .foregroundStyle(event.textColor)
                .font(.title)
                .bold()
            Text(properDate)
        }).onReceive(timer) { input in
            currentDate = input
        }
    }
}

#Preview {
    EventRow(event: Event(title: "Halloween", date: Date().addingTimeInterval(2000), textColor: .yellow))
}
