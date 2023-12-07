//
//  ContentView.swift
//  Annotation
//
//  Created by Pengkhieng Kim on 7/12/23.
//

import SwiftUI
import PDFKit


struct ContentView: View {
    let appColors = AppColors.shared
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [appColors.primaryColor, appColors.blue2A88DE]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    ContentView()
}

