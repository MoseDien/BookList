//
//  Book.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//
import Foundation

struct Book: Decodable {
    let title: String
    let author: String
    let image: String?
    let link: String?
    let pages: Int?
    let year: Int?
}


enum BookCategory {
    case bestSeller, nonFiction, fiction, kid
}

extension Book {
    var displayYear: String {
        if let year = year {
            return "\(year)"
        } else {
            return "--"
        }
    }
}
