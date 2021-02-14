//
//  TabFiveView.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/14.
//

import SwiftUI

struct TabFiveView: View {
    @State var isImagePickerViewPresented = false
    @State var selectedImage: UIImage? = nil
    @State var info = ""
    @State var backgroundColor = Color.red

    
    var body: some View {
        VStack {
            Button(action: {
                isImagePickerViewPresented = true
            }, label: {
                
                if selectedImage == nil {
                    Image(systemName: "camera").font(.largeTitle)

                } else {
                    Image(uiImage: selectedImage!).resizable().frame(width: 200, height: 200).scaledToFit().cornerRadius(100)

                }
                
            })
            .sheet(isPresented: $isImagePickerViewPresented, content: {
                ImagePickerView(delegate: ImagePickerView.Delegate(isPresented: $isImagePickerViewPresented, didSelect: {
                    (image) in
                    selectedImage = image
                }, didCancel: {
                    print("Image picker was canceled.")
                }))
            })
            
//            Text("Info: \(info)")
            TitleView(text: $info).frame(height: 40)
            
            SettingsView(backgroundColor: $backgroundColor, delegate: SettingsView.Delegate(didTapButton: { (info) in
                self.info = info
            }))
            
            Button(action: {
                backgroundColor = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
            }, label: {
                Text("Change UIViewController background color")
            })
        }
    }
}

struct TabFiveView_Previews: PreviewProvider {
    static var previews: some View {
        TabFiveView()
    }
}
 
