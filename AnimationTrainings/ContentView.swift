//
//  ContentView.swift
//  AnimationTrainings
//
//  Created by Cihat Tascı on 17.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State var animated: Bool = false
    @State var colorAnimated: Bool = false
    @State var rotate: Bool = false
    @State var xpos: CGFloat = 200
    @State var ypos: CGFloat = 150
    @State var isWidth: Bool = true
    @State var isShow: Bool = true
    var body: some View {
        VStack{
            Button("First"){
                animated.toggle()
                colorAnimated.toggle()
                ypos = 500
            }
            Button("Second"){
                animated.toggle()
                colorAnimated.toggle()
                ypos = 150
            }.padding(.top, 20)
            Button("Rotate"){
                rotate.toggle()
            }.padding(.top, 20)
            Button("Width"){
                isWidth.toggle()
            }.padding(.top, 20)
            Button("Show"){
                isShow.toggle()
            }.padding(.top, 20)
            Spacer()
            RoundedRectangle(cornerRadius: animated ? 0 : 25)
                .fill(colorAnimated ? .black : .red)
                .frame(width: animated ? 100 : 50, height: animated ? 100 : 50)
                .position(x: xpos, y: ypos)
                .rotationEffect(Angle(degrees: rotate ? 360 : 0))
                .animation(.spring(), value: animated)
                .animation(.linear(duration: 5.0), value: colorAnimated)
                .animation(.linear(duration: 5.0), value: ypos)
                .animation(.easeIn(duration: 1.0), value: rotate)
            
            if isShow{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(width: isWidth ? 350 : 50, height: 100)
                    .transition(AnyTransition.opacity.animation(.easeIn))
                    .animation(.linear)
                    //.animation(.spring(response: 2, dampingFraction: 0.2, blendDuration: 1), value: isWidth)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
