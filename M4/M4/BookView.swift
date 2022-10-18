//
//  BookView.swift
//  M4
//
//  Created by ZhangTommy on 19/10/2022.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var book: Book
    var body: some View {
        VStack{
            NavigationLink {
                ReadingView(book: book)
            } label: {
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding(.horizontal,40)
            }

            Text("Click the cover to read")
                .padding()
            
            HStack{
                Text("Mark for later:")
                    .font(.headline)
                Button {
                    book.isFavourite.toggle()
                } label: {
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .font(.headline)
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .font(.headline)
                            .foregroundColor(.yellow)
                    }
                }

            }

        }.navigationTitle(book.title)
    }
    init(book: Book) {
        self.book = book
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookView(book: ViewModel().books[0])
        }
    }
}
