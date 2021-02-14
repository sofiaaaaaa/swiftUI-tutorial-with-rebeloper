//
//  TabFourView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/13.
//

import SwiftUI

struct TabFourView: View {
    @State var isOn = false
    @State var isProfileViewPresented = false
    @State var isFullScreenProfileViewPresented = false
    @State var isActionSheetPresented = false
    @State var isInfoAlertPresented = false
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Text("Discount is ending in 5 hours at midnight")
                    .font(.system(.headline)).foregroundColor(.red)
                Toggle("Hide Navigation bar", isOn: $isOn)
                
                Button("Present Profile") {
                    isProfileViewPresented = true
                }
                .sheet(isPresented: $isProfileViewPresented, content: {
                    ProfileView()
                })
                
                Button("Present Full Screen Profile") {
                    isFullScreenProfileViewPresented = true
                }.fullScreenCover(isPresented: $isFullScreenProfileViewPresented) {
                    ProfileView()
                }
                
                Button("Present Action Sheet") {
                    isActionSheetPresented = true
                }
                .actionSheet(isPresented: $isActionSheetPresented) {
                    var buttons = [ActionSheet.Button]()
                    
                    let sheetButton = ActionSheet.Button.default(Text("Sheet")) {
                        isProfileViewPresented = true
                    }
                    
                    buttons.append(sheetButton)
                    
                    let fullScreenCover = ActionSheet.Button.destructive(Text("Full screen cover")) {
                        isFullScreenProfileViewPresented = true
                    }
                    
                    buttons.append(fullScreenCover)
                    
                    buttons.append(.cancel())
                    
                    return ActionSheet(title: Text("Choose a presentation mode"), message: nil, buttons: buttons)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("SwiftUI Camp")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(isOn)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    //                    Button {
                    //                        print("Going to to profile ...")
                    //                    } label: {
                    //                        Image(systemName: "person.circle.fill")
                    //                    }
                    
                    NavigationLink(
                        destination: ProfileView(),
                        label: {
                            Image(systemName: "person.circle.fill")
                        })
                }
            }).alert(isPresented: $isInfoAlertPresented) {
                Alert(title: Text("Info"), message: Text("AAAA"), dismissButton: .cancel(Text("OK")))
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                    isInfoAlertPresented = true
                }
            }
        }
    }
}

struct TabFourView_Previews: PreviewProvider {
    static var previews: some View {
        TabFourView()
    }
}
