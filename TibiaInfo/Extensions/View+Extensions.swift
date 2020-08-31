//
//  View+Extensions.swift
//  TibiaInfo
//
//  Created by Namedix on 28/08/2020.
//  Copyright © 2020 Bartłomiej Pichalski. All rights reserved.
//

import SwiftUI

extension View {
    public func square(width: CGFloat, aligment: Alignment = .center) -> some View {
        frame(width: width, height: width, alignment: aligment)
    }

    public func fullWidth(alignment: Alignment = .center) -> some View {
        frame(minWidth: 0, maxWidth: .infinity, alignment: alignment)
    }

    public func fullHeight(alignment: Alignment = .center) -> some View {
        frame(minHeight: 0, maxHeight: .infinity, alignment: alignment)
    }
}
