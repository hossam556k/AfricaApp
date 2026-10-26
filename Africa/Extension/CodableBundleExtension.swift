//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by MacBook Pro on 23/10/2026.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {

        // 1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file).json in bundle.")
        }

        // 2. Load the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file).json from bundle.")
        }

        // 3. Create a decoder
        let decoder = JSONDecoder()

        // 4. Decode the JSON into the requested type
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file).json from bundle.")
        }

        // 5. Return the decoded data
        return loaded
    }
}
