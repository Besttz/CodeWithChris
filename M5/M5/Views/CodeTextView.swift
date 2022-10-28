//
//  CodeTextView.swift
//  M5
//
//  Created by ZhangTommy on 28/10/2022.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    @EnvironmentObject var model:ContentModel

    func makeUIView(context: Context) -> some UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.attributedText = model.currentLessonDesc
    }
}
