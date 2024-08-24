//
//  RequestBuilder.swift
//  Networking
//
//  Created by Janbaz Ali on 23/08/2024.
//

import Combine
import Foundation

class RequestBuilder: RequestBuilderProtocol {

    func buildRequest(from endpoint: EndpointProtocol) -> Result<URLRequest, NetworkError> {
        guard let url = URL(string: endpoint.baseURL) else {
            return .failure(NetworkError.invalidURL)
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return .failure(NetworkError.invalidURL)
        }

        urlComponents.queryItems = endpoint.queryItems
        urlComponents.path = endpoint.path

        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = endpoint.body
        urlRequest.allHTTPHeaderFields = endpoint.headers
        urlRequest.httpMethod = endpoint.method.rawValue

        return .success(urlRequest)
    }
}
