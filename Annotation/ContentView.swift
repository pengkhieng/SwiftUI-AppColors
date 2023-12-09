//
//  ContentView.swift
//  Annotation
//
//  Created by Pengkhieng Kim on 7/12/23.
//


import SwiftUI
import QuickLook

struct ContentView: View {
    
    @StateObject var pdfViewModel = PDFViewModel()
    var urls = "https://icseindia.org/document/sample.pdf"
    
    var body: some View {
        VStack {
            if pdfViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2.0)
            }
        }
        .onAppear {
            Task {
                guard let url = URL(string: "\(urls)") else { return }
                pdfViewModel.downloadPDF(from: url)
                pdfViewModel.getFileName(urlString: "\(url)")
                print(url)
                
            }
        }.fullScreenCover(isPresented: Binding<Bool>(get: { pdfViewModel.pdfData != nil }, set: { _ in })) {
            PDFPreviewWrapper(pdfData: pdfViewModel.pdfData!, pdfURL: pdfViewModel.urlPDF)
        }
       
    }
}


class PDFViewModel: ObservableObject {
    @Published var pdfData: Data?
    @Published var isLoading = false
    @Published var urlPDF = ""
    static let shared = PDFViewModel()
    
    func downloadPDF(from url: URL) {
        isLoading = true
        
        URLSession.shared.dataTask(with: url) { [self] data, _, error in
            if let error = error {
                print("Error downloading PDF: \(error.localizedDescription)")
            } else if let data = data {
                DispatchQueue.main.async {
                    self.pdfData = data
                    print("========\(pdfData)============")
                    self.isLoading = false
                }
            }
        }.resume()
    }
    func getFileName( urlString: String) -> String {
        if let url = URL(string: urlString) {
            urlPDF = url.lastPathComponent
            return url.lastPathComponent
        } else {
            return "Invalid URL"
        }
        
    }
    
        // Function to retrieve file path
        func retrieveTempPDFFilePath() {
            // Use tempPDFFilePath as needed
            print("Temp PDF File Path: ")
        }
}



