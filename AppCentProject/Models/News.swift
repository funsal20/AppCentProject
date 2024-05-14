//
//  News.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import Foundation
import SwiftData

struct News: Codable, Hashable, Identifiable {

    var id = UUID()
    var isFavorite: Bool = false
    let source: [String: String?]
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String

    private enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}
