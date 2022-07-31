//
//  Reminder.swift
//  rx-today
//
//  Created by Yuta Nakamura on 2022/07/31.
//

import Foundation

struct Reminder: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
}

extension Array where Element == Reminder {
    func indexOfReminder(with id: Reminder.ID) -> Self.Index{
        guard let index = firstIndex(where: {$0.id == id}) else {
            fatalError()
        }
        return index
    }
}
