//
//  ActivitiIndicator.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    let color: UIColor

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.style = .medium
        view.color = color
        return view
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
