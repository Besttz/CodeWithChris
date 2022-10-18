//
//  ContentView.swift
//  M4
//
//  Created by ZhangTommy on 19/10/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    
                    ForEach(model.books) { book in
                        NavigationLink {
                            VStack{
                                BookView(book:book)
                            }
                        } label: {
                            BookCardView(book: book)
                            
                        }
                        .shadow(radius: 10.0)
                        .padding()
                    }
                    
                }
            }.navigationTitle("My Library")
        }
        
        
    }
}

struct BookCardView: View {
    // The reason why I moved it to a seperate struct is because When I put it in the parent view, the observing object "model" won't publish if the book in the books array changed. Because the array didn't have any change, only the object inside changed, it doesn't change the reference, so the publisher won''t be called.
    // Now I separate the view and it's observing the book Object directly, so when this object changed, the view will know the change
    @ObservedObject var book: Book

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            
            VStack(alignment: .leading){
                HStack(alignment: .center){
                    Text(book.title)
                        .font(.title)
                    Spacer()
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }
                }
                
                
                Text(book.author)
                    .font(.caption)
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                
            }
            .padding()
            .foregroundColor(.black)
        }
        .cornerRadius(10)
    }
    init(book: Book) {
        self.book = book
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
