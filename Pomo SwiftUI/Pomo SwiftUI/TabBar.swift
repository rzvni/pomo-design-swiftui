//
//  TabBar.swift
//  Pomo SwiftUI
//
//  Created by roli on 01.07.20.
//  Copyright © 2020 Roland Iana. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor.black
        
    }
    
    var body: some View {
        TabView {
            DaysListView().tabItem {
                Image(systemName: "chart.bar.fill")
                Text("")
            }
            ContentView().tabItem {
                Image(systemName: "plus")
                Text("")
            }
            TaskListView().tabItem {
                Image(systemName: "list.bullet")
                Text("")
            }
        }.accentColor(Color(#colorLiteral(red: 0, green: 1, blue: 0.5294117647, alpha: 1)))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

