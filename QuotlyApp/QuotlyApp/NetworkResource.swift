//
//  NetworkResource.swift
//  Quotly
//
//  Created by Rachit Prajapati on 1/19/24.
//

import Foundation


class Quotes: Encodable, Decodable {
    let q: String
    let a: String
    let c: String
    let h: String
    
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
            return "invalid URL input"
            
        case .invalidURLResponse:
            return "invalid URL response"
            
        case .invalidURLData:
            return "invalid data found"
        }
    }
}


final class NetworkResource {
    
    static func getQuotes() async throws -> [Quotes] {
        
        let urlString = "https://zenquotes.io/api/quotes/"
        
        guard let url = URL(string: urlString) else {
//            return [Quotes]() //to return nothing
            throw ErrorCases.invalidURL
            
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw ErrorCases.invalidURLResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Quotes].self, from: data)
        } catch {
            throw ErrorCases.invalidURLData
        }
    }
}
