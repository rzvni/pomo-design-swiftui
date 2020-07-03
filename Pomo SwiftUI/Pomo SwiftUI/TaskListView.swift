//
//  TaskListView.swift
//  Pomo SwiftUI
//
//  Created by roli on 02.07.20.
//  Copyright © 2020 Roland Iana. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    var body: some View {
        VStack {
            VStack (spacing: 15) {
            HStack {
                Text("Tasks")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                }.padding([.top, .leading, .trailing], 30)
            }
               
            
            TaskCard()
            
             Spacer()
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCard: View {
    var body: some View {
        VStack() {
            HStack {
                TaskRingView(width: 90, height: 90, percent: 69).padding(.horizontal, 20)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Task")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Time")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            
                            Text("25 min")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                        }.padding(.trailing)
                        
                        VStack(alignment: .leading) {
                            Text("Goal")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            
                            Text("50h")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(.primary)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Deadline")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        
                        Text("02.02.2020")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(.primary)
                    }

                }.padding(.horizontal)
                Spacer()
            }

            
        }
        .frame(width: 340.0, height: 150.0)
        .background(Color.primary.opacity(0.1))
            //                .cornerRadius(20)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(radius: 20)

    }
}

struct TaskRingView: View {
    var color1 = #colorLiteral(red: 0, green: 1, blue: 0.5294117647, alpha: 1)
    var color2 = #colorLiteral(red: 0.3764705882, green: 0.937254902, blue: 1, alpha: 1)
    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: CGFloat = 88
    
    var body: some View {
        let multiplier = width/44
        let progress = 1 - percent / 100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0)
            )
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}
