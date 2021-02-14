//
//  ImagePickerView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/14.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
    
    init(allowsEditing: Bool = true, delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        self.delegate = delegate
        self.allowsEditing = allowsEditing
    }
    
    let allowsEditing: Bool
    let delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate
    typealias UIViewControllerType = UIImagePickerController

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let controller = UIImagePickerController()
        controller.delegate = delegate
        controller.allowsEditing = allowsEditing

        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    
}

extension ImagePickerView {
    class Delegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        init(isPresented: Binding<Bool>, didSelect: @escaping (UIImage) -> (), didCancel: @escaping () -> ()) {
            self.didSelect = didSelect
            self._isPresented = isPresented
            self.didCancel = didCancel
        }
        
        private let didSelect: (UIImage) -> ()
        private let didCancel: () -> ()
        @Binding var isPresented: Bool
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            var selectedImage = UIImage()
            if let editedImage = info[.editedImage] as? UIImage {
                selectedImage = editedImage
            } else if let originalImage = info[.originalImage] as? UIImage {
                selectedImage = originalImage
            }
            
            didSelect(selectedImage)
            isPresented = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isPresented = false
        }
    }
}
