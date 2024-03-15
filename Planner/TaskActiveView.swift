//
//  TaskActiveView.swift
//  Planner
//
//  Created by Joshua Cao on 3/1/24.
//

import SwiftUI

struct TaskActiveView: View {
    @Binding var isPresentingTaskActiveView: Bool
    @Binding var tasks: [Task]
    @Binding var taskID: Int
    @State var task: Task
    @Binding var isPresentingTaskView: Bool
    var timeTotal: Int
    var timeInterval: Int
    var body: some View {
        VStack {
            Text(task.name)
                .foregroundColor(.white)
                .font(.largeTitle)
            ZStack {
                Circle()
                    .foregroundColor(.white)
                VStack {
                    Text("\(timeTotal) seconds remaining in task")
                    Text("\(timeInterval) seconds in interval")
                    Button(action: {
                        isPresentingTaskActiveView = false
                        isPresentingTaskView = false
                        tasks.remove(at: taskID)
                    }, label: {
                        Text("Done")
                    })
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .onDisappear(){
            self.isPresentingTaskActiveView = false
        }
    }
}
/*/
#Preview {
    TaskActiveView(isPresentingTaskActiveView: .constant(true), task: Task.sampleData[0],timeTotal: 0, timeInterval: 0, tasks: .constant(Task.sampleData),)
}
*/
