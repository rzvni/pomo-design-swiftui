//
//  ContentView.swift
//  Pomo SwiftUI
//
//  Created by roli on 01.07.20.
//  Copyright © 2020 Roland Iana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    
    var body: some View {
        ZStack {
            VStack {
                Text("1. Pomodoro").font(.title).fontWeight(.light).padding(.bottom, 40)
                RingView(color1: UIColor(#colorLiteral(red: 0, green: 1, blue: 0.5294117647, alpha: 1)), color2:UIColor(#colorLiteral(red: 0.3764705882, green: 0.937254902, blue: 1, alpha: 1)), width: 270, height: 270, percent: 69, stroke: 3)
                Text("Study")
                    .fontWeight(.medium)
                    .font(.title).fontWeight(.light).padding(.bottom, 40)
                    .padding(.top, 60.0)
                    .onTapGesture {
                        self.showCard.toggle()
                        print("tap")
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start")
                        
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 130.0)
                        .background(Color(#colorLiteral(red: 0, green: 1, blue: 0.5294117647, alpha: 1)))
                        .cornerRadius(30)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 1, blue: 0.5302632451, alpha: 1)), radius: 5, x: 0, y: 0)
                }
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "stop.fill")
                            .resizable()
                            
                            .frame(width: 30   , height: 30)
                            .scaledToFit()
                            .foregroundColor(.primary)
                            
                            
                            .font(.system(size: 16, weight: .medium))
                        
                        
                    }
                    
                    
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "forward.fill")
                            .resizable()
                            
                            .frame(width: 40   , height: 30)
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .medium))
                        
                    }
                }.padding()
                    .padding(.horizontal, 25)
                
                
                
            }
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300
                        }
                    }
                    .onEnded { value in
                        if self.bottomState.height > 50 {
                            self.showCard = false
                        }
                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull) {
                            self.bottomState.height = -300
                            self.showFull = true
                        } else {
                            self.bottomState = .zero
                            self.showFull = false
                        }
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BottomCardView: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
      @State private var selectedColor = 0
    
    var body: some View {
        VStack() {
            Rectangle()
                .foregroundColor(.primary)
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            

 
            
            Picker(selection: .constant(1), label: Text("Picker")) {
            Text("1").tag(1)
            Text("2").tag(2)
            }.labelsHidden()
            
            Button(action: {}) {
                Text("Select")
                    
                    .fontWeight(.bold)
                    .padding().foregroundColor(.white)
                    .frame(width: 130.0)
                    .background(Color(#colorLiteral(red: 0, green: 1, blue: 0.5294117647, alpha: 1)))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
