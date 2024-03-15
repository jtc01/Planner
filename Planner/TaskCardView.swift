//
//  TaskCardView.swift
//  Planner
//
//  Created by Joshua Cao on 2/26/24.
//

import SwiftUI

struct TaskCardView: View {
    var task: Task
    var body: some View {
        VStack{
            HStack{
                Text(task.name)
                    .font(.title)
                    Spacer()
                Text(task.clss)
                    .font(.title3)
            }
            .padding(.horizontal)
            HStack{
                Text("\(formattedDate(task.date))")
                Spacer()
                Text("\(task.time) minutes")
            }
            .padding(.horizontal)
        }
    }
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct TaskCardViewPreview: PreviewProvider{
    static var previews: some View{
        TaskCardView(task: Task.sampleData[0])
    }
}
