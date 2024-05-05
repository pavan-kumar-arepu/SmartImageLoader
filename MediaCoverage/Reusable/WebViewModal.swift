//
//  WebViewModal.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct WebViewModal: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://acharyaprashant.org/")!)
                .navigationBarTitle("Acharya Prashant", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                })
        }
    }
}
