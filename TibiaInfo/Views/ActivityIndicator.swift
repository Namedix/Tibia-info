//
//  ActivitiIndicator.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    public init() {}

    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.style = .medium
        view.color = .white
        return view
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
