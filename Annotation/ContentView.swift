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
    let appSpacing = AppSpacing.shared
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            LinearGradient(gradient: Gradient(colors: [appColors.primaryColor, appColors.blue2A88DE]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: appSpacing.spacing_12){
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
                    .padding(.horizontal,appSpacing.spacing_32)
                    .padding(.vertical,appSpacing.spacing_12)
                    .background(Color(appColors.redColor))
                Spacing.height(appSpacing.large)
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 100)
                    )
                    .frame(width: 200, height: 200)
                Spacing.height(appSpacing.large)
                HStack(spacing: appSpacing.spacing_12){
                    Text("Item 1")
                        .padding(.horizontal,appSpacing.spacing_32)
                        .padding(.vertical,appSpacing.spacing_12)
                        .background(Color(appColors.redColor))
                    Spacing.width(appSpacing.spacing_20)
                    Text("Item 2")
                        .padding(.horizontal,appSpacing.spacing_32)
                        .padding(.vertical,appSpacing.spacing_12)
                        .background(Color(appColors.redColor))
                }
            }
            .padding(appSpacing.large)
        }
        );
    }
}


#Preview {
    ContentView()
}

