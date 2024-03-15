//
//  TaskEditView.swift
//  Planner
//
//  Created by Joshua Cao on 3/15/24.
//

import SwiftUI

struct TaskEditView: View {
    @Binding var tasks: [Task]
    @State var task: Task
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "tortoise")
                TextField("Task Name", text: $task.name)
            }
            HStack {
                Image(systemName: "note.text")
                TextField("Class", text: $task.clss)
            }
            
            HStack{
                Image(systemName: "timer")
                Slider(value: Binding<Double>(
                    get: {Double(task.time) },
                    set: { task.time = Int($0) }
                    ) , in: 5...30, step: 1)
            }
            /*
            HStack{
                DatePicker("Due Date", selection: $task.date, displayedComponents: .date)
            }
             */
        }
    }
}

#Preview {
    TaskEditView(tasks: .constant(Task.sampleData), task: Task.sampleData[0])
}

