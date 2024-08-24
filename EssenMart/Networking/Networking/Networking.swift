//
//  Networking.swift
//  Networking
//
//  Created by Janbaz Ali on 24/08/2024.
//

import Combine
import Foundation

class Networking: NetworkServiceProtocol {

    let urlSession: URLSession
    let requestBuilder: RequestBuilderProtocol

    init(
        urlSession: URLSession = .shared,
        requestBuilder: RequestBuilderProtocol = RequestBuilder()
    ) {
        self.urlSession = urlSession
        self.requestBuilder = requestBuilder
    }

    func fetch<T>(_ endpoint: EndpointProtocol) -> AnyPublisher<T, NetworkError> where T : Decodable {
        switch requestBuilder.buildRequest(from: endpoint) {
        case .success(let request):
            return urlSession.dataTaskPublisher(for: request)
                .mapError { NetworkError.requestFailed($0)}
                .flatMap { data, response -> AnyPublisher<T, NetworkError> in
                    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        return Fail(error: NetworkError.unknown).eraseToAnyPublisher()
                    }

                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError {NetworkError.decodingFailed($0)}
                        .eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()

        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        }
    }

}
