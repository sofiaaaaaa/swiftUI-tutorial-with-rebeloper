//
//  HostedSwiftUIViewModel.swift
//  SwiftUIGuide
//
//  Created by punky on 2021/02/14.
//

import SwiftUI

class HostedSwiftUIViewModel: ObservableObject {
    @Published var incoming: String = ""
    @Published var outgoing: String = ""

}
