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
        case caregories = "categories"
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
    
    ///Gets all categories of to filter meals
    ///
    /// - [Example](https://themealdb.com/api/json/v1/1/categories.php)
    ///
    /// - Returns: list of CaregoryItem in CategoryResponse
    static func getCategories() async -> Result<CategoryResponse, Error> {
        
        let components = baseAPIComponents(.caregories)
        let request = URLRequest(url: components.url!)
        
        return await agent.run(request)
    }
    
    ///Gets all items of specificed filter
    ///
    /// - [Example](https://themealdb.com/api/json/v1/1/filter.php?c=Dessert)
    ///
    /// - Returns: list of FilterItem in FilterResponse
    static func getFilter(filter:String) async -> Result<FilterResponse, Error> {
        
        var components = baseAPIComponents(.filter)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "c", value: filter)])
        let request = URLRequest(url: components.url!)
        
        return await agent.run(request)
    }
    
    ///Looks up item of specified id
    ///
    /// - [Example](https://themealdb.com/api/json/v1/1/lookup.php?i=52988)
    ///
    /// - Returns: list of LookupItem in LookupResponse
    static func getLookup(id:String) async -> Result<LookupResponse, Error> {
        
        var components = baseAPIComponents(.lookup)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: id)])
        let request = URLRequest(url: components.url!)
        
        return await agent.run(request)
    }
    
}
