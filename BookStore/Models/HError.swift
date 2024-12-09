//
//  HError.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

enum HError: Error {
    case networkError(message: String)
    case invalidInput(reason: String)
    case unknownError
    case biometricFailed
    case fileNotFound
    case invalidResponse
}
