//
//  NewsDetailViewModel.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 15.05.2024.
//

import Foundation

class NewsDetailViewModel: ObservableObject {
    
    @Published var news: News

    init(news: News) {
        self.news = news
    }

    func filterDate(date: String) -> String {
        let originalString = date
        let startIndex = originalString.startIndex
        let endIndex = originalString.index(startIndex, offsetBy: 10)
        let filteredString = originalString[startIndex..<endIndex]
        return String(filteredString)
    }

}
