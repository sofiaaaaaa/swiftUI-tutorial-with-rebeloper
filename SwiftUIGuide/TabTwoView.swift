//
//  TabTwoView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/12.
//

import SwiftUI

struct TabTwoView: View {
    @State var isOn = false
    @State private var text = ""
    @State private var password = ""
    @State private var value = 0
    @State private var currentName = ""
    @State private var selected = ""
    var names = ["A", "B", "C"]
    
    var body: some View {
        //        TabView {
        //            Text("Tab1")
        //            Text("Tab2")
        //        }.tabViewStyle(PageTabViewStyle())
        //
        //        Button("Tab me") {
        //            print("Hello SwiftUI Guide")
        //        }
        
        //        Button {
        //            print("Hello")
        //        } label: {
        //
        //            Image(systemName: "ladybug.fill").font(.system(size: 100)).foregroundColor(.red)
        //        }
        
        //        Button(action: {
        //            print("Hello")
        //        }, label: {
        //            Text("Tap me")
        //                .bold()
        //                .foregroundColor(.green)
        //                .padding()
        //        })
        //        .background(
        //            RoundedRectangle(cornerRadius: 8)
        //                .stroke(Color.green, lineWidth: 2)
        //        )
        //        .cornerRadius(8)
        
        //        Link("rebeloper.com", destination: URL(string:"https://rebeloper.com/metoring")!)
        //
        
        
        VStack(spacing: 12) {
            if isOn {
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Image(systemName: "ladybug.fill").font(.system(size: 100)).foregroundColor(.red)
                }).background(Color.green)
            }
            
//            Toggle("Toggle me", isOn: $isOn)
            Toggle(isOn: $isOn){
                Image(systemName: "link").font(.system(size: 100)).foregroundColor(.red)
            }.labelsHidden()
            .toggleStyle(SwitchToggleStyle(tint: .red))
            
            Label(text, systemImage: "hare.fill")
            
            TextField("Type text here...", text: $text).font(.system(size: 50)).foregroundColor(.red)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
            
            SecureField("Password", text: $password) {
                print(password)
            }
            
            ProgressView()
            
            ProgressView("Loading")
            
            ProgressView(value: 0.2) {
                Text("Loading..")
            }.accentColor(.red)
            
            ProgressView(value: 20, total: 200) {
                Text("Loading..")
            }
          
            
            VStack {
                Text(currentName).bold()
                
    //            Picker(selection: $selected, label: Text("Picker Names"), content: {
    //                Text("1").tag(1)
    //                Text("2").tag(2)
    //                Text("3").tag(3)
    //            }).pickerStyle(MenuPickerStyle())
                Picker(selection: $currentName, label: Text("Picker"), content: {
                    ForEach(names, id: \.self) { name in
                        Text(name).bold()
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.red)
                .cornerRadius(8)
            }
            
            
            
        }.padding()
        
        
    }
}

struct TabTwoView_Previews: PreviewProvider {
    static var previews: some View {
        TabTwoView()
    }
}
