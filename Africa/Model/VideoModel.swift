//
//  VideoModel.swift
//  Africa
//
//  Created by MacBook Pro on 25/10/2026.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline : String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
