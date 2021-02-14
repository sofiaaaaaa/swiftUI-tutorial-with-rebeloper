//
//  ProfileView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/13.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Hello, World")
            Button {
                presentationMode.wrappedValue.dismiss()
            } label : {
                Text("Back").bold()
            }
        }
        .padding()
        .navigationTitle("Profile")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label : {
                    Image(systemName: "chevron.backward.2")
                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
