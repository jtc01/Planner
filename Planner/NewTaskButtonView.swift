//
//  NewTaskButtonView.swift
//  Planner
//
//  Created by Joshua Cao on 3/13/24.
//

import SwiftUI

struct NewTaskButtonView: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 55, height: 65)
                Image(systemName: "plus")
                    .foregroundColor(.blue)
            }
            Text("New Task")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    NewTaskButtonView()
}
