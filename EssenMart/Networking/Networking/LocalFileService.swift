//
//  LocalFileService.swift
//  Networking
//
//  Created by Janbaz Ali on 24/08/2024.
//

import Combine
import Foundation

class LocalFileService: NetworkServiceProtocol {
    let requestBuilder: RequestBuilderProtocol

    init(requestBuilder: RequestBuilderProtocol) {
        self.requestBuilder = requestBuilder
    }

    func fetch<T>(_ endpoint: EndpointProtocol) -> AnyPublisher<T, NetworkError> where T : Decodable {

        guard let data = LocalFileHelper.fetchData(endpoint.path) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        return Just(data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { NetworkError.decodingFailed($0) }
            .eraseToAnyPublisher()
    }

}
