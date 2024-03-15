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
    @State var isPresentingTaskActiveView: Bool = false
    @Binding var isPresentingTaskView: Bool
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
                        isPresentingTaskActiveView = true
                    }) {
                        Label("Start", systemImage: "tortoise")
                    }
                    .font(.headline)
                    .foregroundColor(.blue)
                    .sheet(isPresented: $isPresentingTaskActiveView) {
                        TaskActiveView(isPresentingTaskActiveView: $isPresentingTaskActiveView, tasks: $tasks, taskID: $taskID, task: task, isPresentingTaskView: $isPresentingTaskView, timeTotal: task.time, timeInterval: 0)
                    }
                }
            }
        }
    }
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
/*
#Preview {
    TaskView(tasks: Task.$sampleData, taskID: $0, task: .constant(Task.sampleData[0]))
}
*/

//please sign Germán please please please pleasde pljeasde
//el canalón de pescado

//whelp looks like we got Rodriguez
//hopefully he's our canalón de pescado
