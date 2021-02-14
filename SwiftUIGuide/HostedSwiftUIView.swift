//
//  HostedSwiftUIView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/14.
//

import SwiftUI

struct HostedSwiftUIView: View {
    
    @EnvironmentObject var viewModel: HostedSwiftUIViewModel
    
    var body: some View {
        VStack {
            Text("SwiftUI Text: \(viewModel.incoming)")
            
            Button(action: {
                viewModel.outgoing = String("ABCDEFGHIJK".randomElement()!)
            }, label: {
                Text("Tap SwiftUi Button and Change UILabel text")
            })
        }
    }
}

struct HostedSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HostedSwiftUIView()
    }
}
