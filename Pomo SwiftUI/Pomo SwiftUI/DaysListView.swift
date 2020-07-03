//
//  DaysListView.swift
//  Pomo SwiftUI
//
//  Created by roli on 02.07.20.
//  Copyright © 2020 Roland Iana. All rights reserved.
//

import SwiftUI

struct DaysListView: View {
    var body: some View {
        
        VStack {
            VStack (spacing: 15) {
            HStack {
                Text("Days")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                }.padding([.top, .leading, .trailing], 30)
            }
               
            
            HStack(spacing: 28) {
                BarView(value: 50)
                BarView(value: 70)
                BarView(value: 90)
                BarView(value: 50)
                BarView(value: 100)
                BarView(value: 30)
                BarView(value: 50)

            }
            
             Spacer()
        }
        
        
    }
}

struct DaysListView_Previews: PreviewProvider {
    static var previews: some View {
        DaysListView().environment(\.colorScheme, .dark)
    }
}

struct BarView: View {
    var value: CGFloat
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 20, height: 120)
                    .foregroundColor(Color.primary.opacity(0.2))
                Capsule().frame(width: 20, height: value)
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 1, blue: 0.5294117647, alpha: 1)), Color(#colorLiteral(red: 0.3764705882, green: 0.937254902, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom)).cornerRadius(20)
            }
            Text("D").padding(.top, 8)
        }
    }
}

