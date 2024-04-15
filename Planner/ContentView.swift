//
//  ContentView.swift
//  Planner
//
//  Created by Joshua Cao on 2/26/24.
//

import SwiftUI

struct ContentView: View {
    @State var tasks: [Task]
    @State var selectedTask: Task?
    @State var selectedID: Int
    @State var isPresentingTaskView: Bool = false
    @State var isPresentingTaskEditView: Bool = false
    @State var newTask: Task = Task.sampleData[3]
    
    init() {
        // Initialize tasks property
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            _tasks = State(initialValue: savedTasks)
        } else {
            _tasks = State(initialValue: Task.sampleData)
        }
        
        // Initialize other properties
        _selectedID = State(initialValue: 0)
    }
    
    var body: some View {
        NavigationView {
            VStack{
                LogoView(pageTitle: "Turtle Tasks")
                List(tasks.indices, id: \.self){ index in
                    Button(action: {
                        self.selectedTask = self.tasks[index]
                        self.selectedID = index
                        self.isPresentingTaskView = true
                    }) {
                        TaskCardView(task: self.tasks[index])
                    }
                }
                Button(action: {
                    self.isPresentingTaskEditView = true
                }) {
                    NewTaskButtonView()
                        .cornerRadius(3.0)
                        .frame(height: 75)
                }
            }
            .sheet(isPresented: $isPresentingTaskView) {
                TaskView(tasks: $tasks, taskID: $selectedID, task: $tasks[selectedID], isPresentingTaskActiveView: false, isPresentingTaskView: $isPresentingTaskView, isPresentingTaskEditView: false)
            }
            
            .sheet(isPresented: $isPresentingTaskEditView){
                TaskEditView(tasks: $tasks, task: $newTask, isPresentingTaskEditView: $isPresentingTaskEditView, isEditingNewTask: true, taskID: 0)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var tasks: [Task] = Task.sampleData
    static var previews: some View{
        ContentView()
    }
}

//I want to store the tasks variable locally, how should I do that? should I use NS user defaults?

//ask chatGPT to solve the errors its probbly rlly stupid hopefully Berterame signs when you're reading this but you're probably really sad that he didn't
//he didn't sign :(
//Turtle Tasks!
//we can't even get amorim why do i keep getting rejected???????????
