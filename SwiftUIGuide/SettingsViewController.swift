//
//  SettingsViewController.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/14.
//

import UIKit
import SwiftUI
import Combine

protocol SettingsViewControllerDelegate {
    func didTapButton(info: String)
}

class SettingsViewController: UIViewController {
    var delegate: SettingsViewControllerDelegate?
    
    lazy var button0: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap the UIButton and change the Hosting SwiftUI View", for: .normal)
        button.addTarget(self, action: #selector(button0Tapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    func button0Tapped() {
        delegate?.didTapButton(info: String("ABCDEFGHIJK".randomElement()!))
        
    }
    
    
    lazy var button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap the UIButton and Hosted SwiftUI View", for: .normal)
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    func button1Tapped() {
        swiftUIViewModel.incoming = String("ABCDEFGHIJK".randomElement()!)
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    
    let hostingUIView = UIView()
    let swiftUIView = HostedSwiftUIView()
    let swiftUIViewModel = HostedSwiftUIViewModel()
    private var cancelables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBackgroundColor(.systemRed)
        
        setupViews()
        setupHostingUIView()
        setupHostedSwiftUIView()
        subscribeToHostedSwiftUIViewChanges()
    }
    
    func changeBackgroundColor(_ uiColor: UIColor) {
        view.backgroundColor = uiColor
    }
    
    func setupViews() {
        view.addSubview(button0)
        button0.translatesAutoresizingMaskIntoConstraints = false
        button0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        button0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.topAnchor.constraint(equalTo: button0.bottomAnchor).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: button1.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupHostingUIView() {
        view.addSubview(hostingUIView)
        
        hostingUIView.translatesAutoresizingMaskIntoConstraints = false
        hostingUIView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        hostingUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    func setupHostedSwiftUIView() {
        let hostingController = UIHostingController(rootView: swiftUIView.environmentObject(swiftUIViewModel))
//        hostingController.view.backgroundColor = .systemYellow
        
        self.addChild(hostingController)
        hostingController.didMove(toParent: self)
        
        self.hostingUIView.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: hostingUIView.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: hostingUIView.bottomAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: hostingUIView.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: hostingUIView.trailingAnchor).isActive = true
    }
    
    func subscribeToHostedSwiftUIViewChanges() {
        swiftUIViewModel.$outgoing
            .receive(on: DispatchQueue.main)
            .sink { [weak self](text) in
            self?.label.text = "UILabel received text: \(text)"
            }.store(in: &cancelables)
    }
}
