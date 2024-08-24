//
//  NetworkServiceProtocol.swift
//  Networking
//
//  Created by Janbaz Ali on 23/08/2024.
//

import Combine
import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: EndpointProtocol) -> AnyPublisher<T, NetworkError>
}
