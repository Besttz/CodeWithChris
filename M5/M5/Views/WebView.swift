//
//  WebView.swift
//  M5
//
//  Created by ZhangTommy on 22/10/2022.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
//    typealias UIViewType = WKWebView
    

    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url:  URL(string: "https://tomperwa.au")!)
        uiView.load(request)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView()
    }
}
