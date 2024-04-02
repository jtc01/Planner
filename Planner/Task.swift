//
//  Task.swift
//  Planner
//
//  Created by Joshua Cao on 2/26/24.
//

import Foundation

struct Task: Identifiable, Equatable, Encodable, Decodable {
    let id: UUID
    var name: String
    var date: Date
    var time: Int
    var clss: String
    init(id: UUID = UUID(), name: String, date: Date, time: Int, clss: String) {
        self.id = id
        self.name = name
        self.date = date
        self.time = time
        self.clss = clss
    }
}
extension Task {
    static let sampleData: [Task] =
    [
        Task(name:"Essay", date: Date(), time: 60, clss: "English"),
        Task(name:"Math Homework", date: Date(), time: 5, clss: "Math"),
        Task(name: "Lab report", date: Date(), time: 5, clss: "Physics"),
        Task(name: "New Task", date: Date(),time: 5, clss:"Choose Class")
    ]
    static let newTask: Task = Task(name: "", date: Date(), time: 0, clss: "")
}
