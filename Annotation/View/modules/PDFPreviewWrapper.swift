//
//  PDFPreviewWrapper.swift
//  dwf-ios
//
//  Created by Khieng on 14/3/23.
//

import SwiftUI
import QuickLook

struct PDFPreviewWrapper: UIViewControllerRepresentable {
    var pdfData: Data
    var pdfURL: String
    func makeUIViewController(context: Context) -> UINavigationController {
        let controller = QLPreviewController()
        controller.dataSource = context.coordinator
        
        let navController = UINavigationController(rootViewController: controller)
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: context.coordinator, action: #selector(Coordinator.saveButtonTapped))
        controller.navigationItem.leftBarButtonItem = saveButton // add save button to the navigation bar
        return navController
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No-op
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(pdfData: pdfData, pdfURL: pdfURL)
    }
    
    class Coordinator: NSObject, QLPreviewControllerDataSource {
        var pdfData: Data
        var pdfURL: String
        var controller: QLPreviewController // hold a reference to the QLPreviewController
        
        init(pdfData: Data,pdfURL: String) {
            self.pdfData = pdfData
            self.pdfURL = pdfURL
            self.controller = QLPreviewController()
            super.init()
        }
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        func previewController(_ controller: QLPreviewController, editingModeFor previewItem: QLPreviewItem) -> QLPreviewItemEditingMode {
                print("Edited")
                print(previewItem.previewItemURL)
                return .updateContents
            }
      
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            let fileManager = FileManager.default
            let tempDirectory = fileManager.temporaryDirectory
            let filePath = tempDirectory.appendingPathComponent(pdfURL)

            do {
                try pdfData.write(to: filePath)
            } catch {
                print("Error writing PDF data to disk: \(error.localizedDescription)")
            }
            return filePath as QLPreviewItem
        }
        @objc func saveButtonTapped() {
            print("Save Success")
            removeTempFile()
        }
        func removeTempFile() {
            let fileManager = FileManager.default
            let tempDirectory = fileManager.temporaryDirectory
            let filePath = tempDirectory.appendingPathComponent(pdfURL)
            
            do {
                try fileManager.removeItem(at: filePath)
                print("remove file success")
            } catch {
                print("Error removing temp file: \(error.localizedDescription)")
            }
        }
    }
}
