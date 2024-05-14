//
//  NetworkCall.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import Foundation

struct NetworkCall: Codable, Hashable {
    let status: String
    let totalResult: Int?
    let articles: [News]
}
