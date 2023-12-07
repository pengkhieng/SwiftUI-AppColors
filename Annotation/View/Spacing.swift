//
//  Height.swift
//  Annotation
//
//  Created by Pengkhieng Kim on 7/12/23.
//

import SwiftUI

class Spacing {
    static func height(_ pixels: CGFloat) -> some View {
        Spacer()
            .frame(height: pixels)
            .background(Color.yellow)
            .padding(0)
    }
    static func width(_ pixels: CGFloat) -> some View {
        Spacer()
            .frame(width: pixels)
            .background(Color.orange)
            .padding(0)
    }
}
