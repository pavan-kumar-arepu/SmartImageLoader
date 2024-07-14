//
//  WebViewModal.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

/**
 *  WebViewModal..swift
 *
 *  Represents a SwiftUI view for displaying a web page using a WKWebView.
 *  It conforms to the UIViewRepresentable protocol, allowing integration of UIKit components within SwiftUI views.
 *  The WebViewModal view provides a modal presentation for the web view, with an optional loading indicator.
 *
 *  - Author: Arepu PavanKumar
 */

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    /// Creates and returns a WKWebView instance.
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    /// Updates the web view.
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

/// View for displaying a modal web view.

struct WebViewModal: View {
    @State private var isLoading = true
    @Binding var showModal: Bool

    let url: URL

    var body: some View {
        VStack {
            
            // Display a progress view while loading
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                // Display the web view once loading is complete
                WebView(url: url)
            }
        }
        .onAppear {
            // Simulate some asynchronous task
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
}
