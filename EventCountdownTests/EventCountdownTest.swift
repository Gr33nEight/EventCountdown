//
//  ContentViewTests.swift
//  EventCountdownTests
//
//  Created by Natanael Jop on 22/11/2024.
//

import XCTest
import SwiftUI
@testable import EventCountdown

final class EventCountdownTest: XCTestCase {

    func testEmptyEventsState() throws {
        let view = ContentView(events: [])
        XCTAssertTrue(view.events.isEmpty, "Events array should be empty")
    }
    
    func testAddingEvent() {
        var events = [Event]()
        let newEvent = Event(title: "New Event", date: Date(), textColor: .blue)
        
        events.append(newEvent)
        
        XCTAssertEqual(events.count, 1, "Events array should contain one event")
        
        guard let firstEvent = events.first else {
            XCTFail("First event should not be nil")
            return
        }
        
        XCTAssertEqual(firstEvent.title, "New Event", "Events title should match")
    }
    
    func testEditingEvent() {
        let event1 = Event(title: "Event 1", date: Date(), textColor: .red)
        let event2 = Event(title: "Event 2", date: Date(), textColor: .green)
        var events = [event1, event2]
        
        let updatedEvent = Event(id: event2.id, title: "Updated Event 2", date: event2.date, textColor: .blue)
        if let index = events.firstIndex(where: {$0.id == updatedEvent.id}) {
            events[index] = updatedEvent
        }
        
        XCTAssertEqual(events[1].title, "Updated Event 2", "The second event should be updated")
        XCTAssertEqual(events[1].textColor, .blue, "The updated event's color should match")
    }
    
    func testDeletingEvent() {
        let event1 = Event(title: "Event 1", date: Date(), textColor: .red)
        let event2 = Event(title: "Event 2", date: Date(), textColor: .green)
        var events = [event1, event2]
        
        events.remove(at: 0)
        
        XCTAssertEqual(events.count, 1, "Events array should contain 1 event")
        XCTAssertEqual(events[0].title, "Event 2", "The remaining event should be 'Event 2'")
    }
}
