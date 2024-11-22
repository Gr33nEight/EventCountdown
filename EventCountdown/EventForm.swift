//
//  EventFrom.swift
//  EventCountdown
//
//  Created by Natanael Jop on 20/11/2024.
//

import SwiftUI

struct EventForm: View {
    var event: Event?
    @State private var title: String
    @State private var date: Date
    @State private var textColor: Color
    
    @State private var showAlert = false
    
    var onSave: (Event) -> Void
    
    init(event: Event? = nil, onSave: @escaping (Event) -> Void) {
        self.event = event
        _title = State(initialValue: event?.title ?? "")
        _date = State(initialValue: event?.date ?? Date())
        _textColor = State(initialValue: event?.textColor ?? .blue)
        self.onSave = onSave
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                    .foregroundStyle(textColor)
                DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                ColorPicker("Text Color", selection: $textColor)
            }
        }.navigationTitle(event == nil ? "Add Event" : "Edit \(event!.title)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar  {
                Button {
                    save()
                } label: {
                    Image(systemName: "checkmark")
                }

            }
            .alert("Title can't be empty", isPresented: $showAlert) {
                Button("Ok", role: .cancel) {}
            }
    }
    
    private func save() {
        if title.isEmpty {
            showAlert = true
        }else{
            let finalEvent = Event(
                id: event?.id ?? UUID(),
                title: title,
                date: date,
                textColor: textColor
            )
            onSave(finalEvent)
            dismiss()
        }
    }
}

#Preview {
    ContentView(events: [Event(title: "Halloween", date: Date().addingTimeInterval(10000), textColor: .yellow)])
}
