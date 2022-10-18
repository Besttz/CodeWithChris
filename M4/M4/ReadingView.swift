//
//  ReadingView.swift
//  M4
//
//  Created by ZhangTommy on 19/10/2022.
//

import SwiftUI

struct ReadingView: View {
    @ObservedObject var book: Book

    var body: some View {
        TabView {
            ForEach(book.content,id: \.self) { texts in
//                ScrollView{
                    Text(texts).padding()
//                }
                .padding(.bottom,50)

            }

        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
    init(book: Book) {
        self.book = book
    }
}

struct ReadingView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingView(book: ViewModel().books[0])
    }
}
