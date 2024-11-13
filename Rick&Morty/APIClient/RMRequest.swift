//
//  RMRequest.swift
//  Rick&Morty
//
//  Created by XTSW-MAC-1137-2 on 06/11/24.
//

import Foundation

/// object that represent a single api call 

final class RMRequest {
    // API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    ///Desired endpoint
    private let endpoint: RMEndpoint
    
    ///Path components for API, if any
    private let pathComponents: [String]
    
    ///query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            // name = value&name=value
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
            
            queryParameters.forEach({
                string += "/\($0)"
            })
        }
        return string
    }
    //Computed and constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    //desired http method
    public let httpMethod = "GET"
    
    //MARK: - Public
    
    ///construct request
    /// -Parameters:
    ///  - endpoint:  target endpoint
    ///   - pathcomponents: Collection path component
    ///    - queryparameters: Collection of query parameters
    public init(endpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listCharactersRequests = RMRequest(endpoint: .character)
}
