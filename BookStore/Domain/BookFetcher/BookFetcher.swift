//
//  BookFetcher.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

import Foundation

class BookFetcher: BookFetching {
    func fetchBooks(categories: [BookCategory]) async throws -> [Book] {
        /*
        // TODO: try to mock the network request time
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return try loadBooks()
        */
        try await loadBooksFromRemote()
    }
}

extension BookFetcher {
    func loadBooks(from filename: String = "books", in bundle: Bundle = .main) throws -> [Book] {
        guard let fileURL = bundle.url(forResource: filename, withExtension: "json") else {
            print("Error: cannot find \(filename).json")
            throw HError.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([Book].self, from: data)
        } catch {
            print("Error: \(error)")
            throw HError.invalidResponse
        }
    }
    
    func loadBooksFromRemote() async throws -> [Book] {
        let endpoint: String = "https://raw.githubusercontent.com/benoitvallon/100-best-books/refs/heads/master/books.json"
        let url = URL(string: endpoint)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Book].self, from: data)
    }
}
