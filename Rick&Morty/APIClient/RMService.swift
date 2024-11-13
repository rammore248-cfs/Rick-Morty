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
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    // send Rick and Morty API call
    // -Parameters
    // -request: Request name
    
    // -completion: callback with data or error
    public func execute<T: Codable> (
    _ request: RMRequest,
        expecting type: T.Type,
    completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            //Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
