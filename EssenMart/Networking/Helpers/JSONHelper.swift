//
//  JSONHelper.swift
//  Networking
//
//  Created by Janbaz Ali on 21/08/2024.
//

import Foundation

class JSONHelper {

    // Generic method to fetch and decode JSON data from a file
    static func fetch<T: Decodable>(_ fileName: String, as type: T.Type) -> T? {
        // Ensure the file exists in the bundle
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Failed to locate \(fileName).json in bundle.")
            return nil
        }

        // Attempt to load the data from the file
        guard let data = try? Data(contentsOf: url) else {
            print("Failed to load \(fileName).json from bundle.")
            return nil
        }

        // Decode the data into the specified type
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print("Failed to decode \(fileName).json: \(error.localizedDescription)")
            return nil
        }
    }
}

