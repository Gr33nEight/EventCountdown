//
//  Event.swift
//  EventCountdown
//
//  Created by Natanael Jop on 20/11/2024.
//

import SwiftUI

struct Event: Identifiable, Comparable {
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
    var id: UUID = UUID()
    var title: String
    var date: Date
    var textColor: Color
}
