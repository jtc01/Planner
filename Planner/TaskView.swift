//
//  TaskView.swift
//  Planner
//
//  Created by Joshua Cao on 3/1/24.
//

import SwiftUI

struct TaskView: View {
    @Binding var tasks: [Task]
    @Binding var taskID: Int
    @Binding var task: Task
    @Binding var isPresentingTaskActiveView: Bool
    @Binding var isPresentingTaskView: Bool
    @State var isPresentingTaskEditView: Bool
    var body: some View {
        NavigationView {
            VStack{
                LogoView(pageTitle: task.name)
                Section(header:
                    HStack{
                        Image(systemName: "pencil.and.scribble")
                        Text("Task Details")
                    }
                ){
                    HStack{
                        Image(systemName: "note.text")
                        Text(task.clss)
                    }
                    HStack{
                        Image(systemName: "timer")
                        Text("\(task.time) minutes")
                    }
                    HStack{
                        Image(systemName: "paperplane.fill")
                        Text("Due \(formattedDate(task.date))")
                    }
                    Button(action: {
                        isPresentingTaskEditView = true
                    }, label: {
                        Text("Edit task")
                    })
                    .font(.headline)
                    .sheet(isPresented: $isPresentingTaskEditView, content: {
                        TaskEditView(tasks: $tasks, task: $task, isPresentingTaskEditView: $isPresentingTaskEditView, isEditingNewTask: false, taskID: taskID)
                    })
                    Button(action: {
                        isPresentingTaskActiveView = true
                    }) {
                        Label("Start", systemImage: "tortoise")
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                }
            }
        }
        
        .sheet(isPresented: $isPresentingTaskActiveView) {
            TaskActiveView(isPresentingTaskActiveView: $isPresentingTaskActiveView, tasks: $tasks, taskID: $taskID, task: task, isPresentingTaskView: $isPresentingTaskView, timeTotal: task.time, isActive: true, timeInterval: 0)
        }
    }
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

//This is TaskView. I want to present TaskActiveView with a sheet, but the TaskView gets presented with isPresentingTaskActiveView as false when I bring it up in ContentView, and it won't change to true. How can I make it possible to change isPresentingTaskActiveView to true, while still starting at false?



/*
#Preview {
    TaskView(tasks: Task.$sampleData, taskID: $0, task: .constant(Task.sampleData[0]))
}
*/

//please sign Germán please please please pleasde pljeasde
//el canalón de pescado

//whelp looks like we got Rodriguez
//hopefully he's our canalón de pescado
