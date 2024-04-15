//
//  TaskActiveView.swift
//  Planner
//
//  Created by Joshua Cao on 3/1/24.
//

import SwiftUI
import Combine

struct TaskActiveView: View {
    @Binding var isPresentingTaskActiveView: Bool
    @Binding var tasks: [Task]
    @Binding var taskID: Int
    @State var task: Task
    @Binding var isPresentingTaskView: Bool
    var timeTotal: Int
    @State var elapsedTime: Int = 0
    var isActive: Bool
    
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
                    Text("\(setTimeTotal(total: timeTotal, interval: timeInterval) - elapsedTime) seconds remaining in task")
                    Text("\(timeInterval - elapsedTime) seconds in interval")
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
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            elapsedTime += 1
        }
        
    }
    func setTimeTotal(total: Int, interval: Int) -> Int{
        var x: Int = 0
        while true{
            x += interval
            if x >= total{
               break
            }
        }
        return x
    }
}

#Preview {
    TaskActiveView(isPresentingTaskActiveView: .constant(true), tasks: .constant(Task.sampleData), taskID: .constant(0), task: Task.sampleData[0], isPresentingTaskView: .constant(true), timeTotal: 3600, isActive: true, timeInterval: 900)
}
