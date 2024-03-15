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
                NewTaskButtonView()
                    .cornerRadius(3.0)
                    .frame(width: .infinity,height: 75)
            }
            .sheet(isPresented: $isPresentingTaskView) {
                TaskView(tasks: $tasks, taskID: $selectedID, task: $tasks[selectedID], isPresentingTaskActiveView: false, isPresentingTaskView: $isPresentingTaskView)
            }
            /*
            .sheet(isPresented: $isPresentingTaskEditView){
                TaskEditView(tasks: $tasks, task: Task.sampleData[3])
            }
            */
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var tasks: [Task] = Task.sampleData
    static var previews: some View{
        ContentView(tasks: tasks, selectedID: 0)
    }
}
//ask chatGPT to solve the errors its probbly rlly stupid hopefully Berterame signs when you're reading this but you're probably really sad that he didn't
//he didn't sign :(
