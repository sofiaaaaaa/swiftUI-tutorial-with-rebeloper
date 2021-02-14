//
//  SettingsView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/14.
//

import SwiftUI

struct SettingsView: UIViewControllerRepresentable {
 
    @Binding var backgroundColor: Color
    
    private let delegate: SettingsViewControllerDelegate

    init(backgroundColor: Binding<Color>, delegate: Delegate) {
        self.delegate = delegate
        self._backgroundColor = backgroundColor
    }
    
    typealias UIViewControllerType = SettingsViewController

    func makeUIViewController(context: Context) -> SettingsViewController {
        let controller = SettingsViewController()
        controller.delegate = delegate
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SettingsViewController, context: Context) {
        uiViewController.changeBackgroundColor(UIColor(backgroundColor))
    }
    
}

extension SettingsView {
    class Delegate: NSObject, SettingsViewControllerDelegate {
        
        init(didTapButton: @escaping (String) -> ()) {
            self.didTapButton = didTapButton
        }
        
        private let didTapButton: (String) -> ()
        
        func didTapButton(info: String) {
                didTapButton(info)
        }
        
    }
}
