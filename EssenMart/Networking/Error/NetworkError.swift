//
//  NetworkError.swift
//  Networking
//
//  Created by Janbaz Ali on 23/08/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case decodingFailed(Error)
    case unknown
}
