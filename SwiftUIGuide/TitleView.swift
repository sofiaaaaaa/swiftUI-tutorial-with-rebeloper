//
//  TitleView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/14.
//

import SwiftUI

struct TitleView: UIViewRepresentable {
    
    @Binding var text: String
    
    typealias UIViewType = UILabel

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.monospacedSystemFont(ofSize: 32, weight: .bold)
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = "UILabel text: \(text)"
    }
    
    
}
