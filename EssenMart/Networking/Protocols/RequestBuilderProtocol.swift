//
//  RequestBuilderProtocol.swift
//  Networking
//
//  Created by Janbaz Ali on 23/08/2024.
//

import Foundation

protocol RequestBuilderProtocol {
    func buildRequest(from endpoint: EndpointProtocol) -> Result<URLRequest, NetworkError>
}
