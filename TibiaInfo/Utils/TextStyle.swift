//
//  TextStyle.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI

struct TextStyle {
    let font: Font
    let color: Color
}

extension TextStyle {
    static let largeTitle: TextStyle = .init(
        font: .system(size: 32),
        color: .appBrownBramble
    )

    static let section: TextStyle = .init(
        font: .system(size: 22),
        color: .appBrownBramble
    )

    static let medium: TextStyle = .init(
        font: .system(size: 18),
        color: .appBrownBramble
    )

    static let small: TextStyle = .init(
        font: .system(size: 12),
        color: .appBrownBramble
    )
}

extension View {
    func textStyle(_ style: TextStyle) -> some View {
        font(style.font).foregroundColor(style.color)
    }
}
