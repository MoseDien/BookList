//
//  BookFetching.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

protocol BookFetching {
    func fetchBooks(categories: [BookCategory]) async throws -> [Book]
}
