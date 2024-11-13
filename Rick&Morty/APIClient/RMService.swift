//
//  RMService.swift
//  Rick&Morty
//
//  Created by XTSW-MAC-1137-2 on 06/11/24.
//

import Foundation

final class RMService {
    //shared singleton instance
    static let shared = RMService()
    
    //priviledge constructor
    private init() {}
    
    // send Rick and Morty API call
    // -Parameters
    // -request: Request name
    
    // -completion: callback with data or error
    public func execute<T: Codable> (
    _ request: RMRequest,
        expecting type: T.Type,
    completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
