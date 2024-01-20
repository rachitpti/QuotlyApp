//
//  QuoteFetchResource.swift
//  QuotlyApp2
//
//  Created by Rachit Prajapati on 1/20/24.
//

import Foundation

struct Quote: Codable {
    var q, a, c, h: String
    
    enum CodingKeys: String, CodingKey {
        case q
        case a
        case c
        case h
    }
}

enum ErrorCases: LocalizedError {
    case invalidURL
    case invalidURLResponse
    case invalidURLData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "invalid URL"
        case .invalidURLData:
            return "invalid url data"
        case .invalidURLResponse:
            return "invalid url response"
        }
    }
}

class QuoteFetchResource {
    
    static func getQuote() async throws -> [Quote] {
        let urlString = "https://zenquotes.io/api/quotes"
        
        guard let url = URL(string: urlString) else {
            throw ErrorCases.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorCases.invalidURLResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let quotes = try decoder.decode([Quote].self, from: data)
            return quotes
        } catch {
            throw ErrorCases.invalidURLData
        }
    }
    
}
