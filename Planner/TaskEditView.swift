//
//  TaskEditView.swift
//  Planner
//
//  Created by Joshua Cao on 3/15/24.
//

import SwiftUI

struct TaskEditView: View {
    @Binding var tasks: [Task]
    @Binding var task: Task
    @Binding var isPresentingTaskEditView: Bool
    @State var isEditingNewTask: Bool
    var taskID: Int
    
    
    
    var body: some View {
        VStack{
            if isEditingNewTask{
                LogoView(pageTitle: "New Task")
            } else {
                LogoView(pageTitle: "Edit Task")
            }
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
                Text("\(task.time) minutes")
                Slider(value: Binding<Double>(
                    get: {Double(task.time) },
                    set: { task.time = Int($0) }
                ) , in: 5...120, step: 5)
            }
            HStack{
                DatePicker("Due Date", selection: $task.date, displayedComponents: .date)
            }
            Button(action: {
                if(isEditingNewTask){
                    tasks.append(task)
                    scheduleNotification(for: task)
                }
                isPresentingTaskEditView=false
                UserDefaults.standard.set(try? JSONEncoder().encode(tasks), forKey: "tasks")
            }, label: {
                if isEditingNewTask{
                    Text("Add Task")
                }
                else{
                    Text("Confirm Changes")
                }
            })
        }
        .padding()
    }
    func scheduleNotification(for task: Task) {
            let notificationContent = UNMutableNotificationContent()
            notificationContent.title = "Task Reminder"
            notificationContent.body = "Don't forget to \(task.name)"
            notificationContent.sound = UNNotificationSound.default

            let calendar = Calendar.current
            let dateComponents = calendar.dateComponents([.year, .month, .day], from: task.date)
            let triggerDate = calendar.date(bySettingHour: 18, minute: 0, second: 0, of: task.date)

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled successfully")
                }
            }
        }
}

#Preview {
    TaskEditView(tasks: .constant(Task.sampleData), task: .constant(Task.sampleData[3]), isPresentingTaskEditView: .constant(true), isEditingNewTask: true, taskID: 0)
}

//Xabi please come to Liverpool I don't think I can take another rejection
//why Xabi whyyyyyy
