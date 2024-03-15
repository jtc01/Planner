//
//  LogoView.swift
//  Planner
//
//  Created by Joshua Cao on 2/26/24.
//

import SwiftUI

struct LogoView: View {
    @State var pageTitle: String
    var body: some View {
        HStack {
            ZStack{
                Circle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Image(systemName: "tortoise")
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
            Text(pageTitle)
                .font(.largeTitle)
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    LogoView(pageTitle: "Turtle Tasks")
}
