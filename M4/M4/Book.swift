//
//  Book.swift
//  M4
//
//  Created by ZhangTommy on 19/10/2022.
//

import Foundation

class Book:ObservableObject,Identifiable, Decodable {
    var id: Int = 0
    var title: String = ""
    var author: String = ""
    @Published var isFavourite: Bool = false
    var currentPage: Int = 0
    var rating: Int = 0
    var content: [String] = []
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case author
        case isFavourite
        case currentPage
        case rating
        case content
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        currentPage = try container.decode(Int.self, forKey: .currentPage)
        rating = try container.decode(Int.self, forKey: .rating)
        title = try container.decode(String.self, forKey: .title)
        author = try container.decode(String.self, forKey: .author)
        content = try container.decode([String].self, forKey: .content)


    }
    
}

class BookPublisher:ObservableObject {
    var book: Book
    @Published var isFavourite:Bool{
        didSet{
            book.isFavourite = isFavourite
        }
    }
    init(_ book:Book){
        self.book = book
        isFavourite = book.isFavourite
    }
}
