//
//  ContentView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 12) {
                        Text("Hellow~")
                            .font(.title)
                            .background(Color(UIColor.systemTeal))
                        Text("HHHELLLOOO")
                            .font(.system(size:32))
                            .foregroundColor(.white)
                            .bold()
                            .background(Color(UIColor.systemTeal))
                            .cornerRadius(8)
                        
                        Image(systemName: "suit.heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                        
                        Divider()
                        
                        ForEach(1...10, id: \.self) { index in
                            Image(systemName: "suit.heart.fill").resizable().frame(width: geometry.size.width, height: geometry.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).scaledToFit()
                        }
                        
                        Spacer()
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
