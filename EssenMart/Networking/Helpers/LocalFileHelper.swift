//
//  JSONHelper.swift
//  Networking
//
//  Created by Janbaz Ali on 21/08/2024.
//

import Foundation

class LocalFileHelper {

    static func fetchData(_ fileName: String) -> Data? {
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

        return data
    }
}

