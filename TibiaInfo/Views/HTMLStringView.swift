//
//  HTMLStringView.swift
//  TibiaInfo
//
//  Created by Namedix on 31/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI
import WebKit

struct HTMLStringView: UIViewRepresentable {
    let htmlContent: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let myVariable = "<font face='SF Pro' size='8' color= 'black'>%@"
        let format = String(format: myVariable, htmlContent)
        uiView.loadHTMLString(format, baseURL: nil)
    }
}
