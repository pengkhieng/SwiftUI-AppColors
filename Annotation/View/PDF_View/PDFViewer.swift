//
//  PDFViewer.swift
//  Annotation
//
//  Created by Pengkhieng Kim on 7/12/23.
//

import SwiftUI
import PDFKit
import PencilKit

struct PDFViewer: View {
    let pdfURL = URL(string: "https://icseindia.org/document/sample.pdf")!
    @State private var pdfDocument: PDFDocument?
    @State private var isDrawing = false
    @State private var canvasView = PKCanvasView()

    var body: some View {
        VStack {
            if let pdfDoc = pdfDocument {
                PDFKitView(pdfDocument: pdfDoc, isDrawing: $isDrawing, canvasView: canvasView)
            } else {
                Text("Loading PDF...")
                    .onAppear {
                        loadPDF()
                    }
            }
        }
    }

    func loadPDF() {
        DispatchQueue.global().async {
            pdfDocument = PDFDocument(url: pdfURL)
        }
    }
}

struct PDFKitView: View {
    let pdfDocument: PDFDocument
    @Binding var isDrawing: Bool
    var canvasView: PKCanvasView

    var body: some View {
        ZStack {
            PDFKitRepresentedView(pdfDocument: pdfDocument)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            if isDrawing {
                DrawingOverlay(canvas: canvasView)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onTapGesture {
            isDrawing.toggle()
        }
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    let pdfDocument: PDFDocument

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = pdfDocument
    }
}

struct DrawingOverlay: UIViewRepresentable {
    let canvas: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.tool = PKInkingTool(.pen, color: .black, width: 5)
        canvas.backgroundColor = .clear
        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}
