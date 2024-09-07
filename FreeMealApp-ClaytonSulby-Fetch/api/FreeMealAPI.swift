//
//  Api.swift
//  FreeMealApp-ClaytonSulby-Fetch
//
//  Created by Clayton Sulby on 9/4/24.
//

import Foundation

public class FreeMealAPI {}

public extension FreeMealAPI {
    
    private static let agent = Agent()
    
    static let baseURL = "https://themealdb.com/api/json/v1/1/"

    private enum APIPage : String {
        case lookup = "lookup"
        case filter = "filter"
    }
    
    private static func baseAPIComponents(_ page:APIPage) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "themealdb.com"
        components.path = "/api/json/v1/1/" + page.rawValue + ".php"
        components.queryItems = []
        return components
    }
}

public extension FreeMealAPI {
    
    ///Gets all items of specificed filter
    ///
    /// - [Example](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert)
    ///
    /// - Returns: list of FilterItem
    static func getFilter(filter:String) async throws -> FilterResponse {
        
        var components = baseAPIComponents(.filter)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "c", value: filter)])
        let request = URLRequest(url: components.url!)
        
        return try await agent.run(request)
            .value
    }
    
    ///Looks up item of specified id
    ///
    /// - [Example](https://themealdb.com/api/json/v1/1/lookup.php?i=52988)
    ///
    /// - Returns: list of LookupItem
    static func getLookup(id:String) async throws -> LookupResponse {
        
        var components = baseAPIComponents(.lookup)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: id)])
        let request = URLRequest(url: components.url!)
        
        return try await agent.run(request)
            .value
    }
    
}
