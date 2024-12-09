//
//  BookListViewModel.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

import Foundation
import Combine

class BookListViewModel {
    @Published var uiState: ViewState = .loading
    @Published var books: [Book] = []
    
    func fetch() {
        uiState = .loading
        guard let url = Bundle.main.url(forResource: "books", withExtension: "json") else {
            uiState = .failure
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            self.books = try JSONDecoder().decode([Book].self, from: data)
            uiState = .success
        } catch {
            uiState = .failure
        }
    }
}
