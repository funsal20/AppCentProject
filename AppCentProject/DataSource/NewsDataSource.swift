//
//  NewsDataSource.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import Foundation
struct NewsDataSource {

    private let baseURL = "https://newsapi.org/v2/everything?q="
    private let baseURL2 = "&page=1&apiKey=432008ddfe064f81a214ee4af906d1bd"
    var delegate: NewsDataSourceDelegate?
    var searchWord: String = "istanbul"

    func loadNewsList() {

        let session = URLSession.shared

        guard let url = URL(string: "\(baseURL)\(searchWord)\(baseURL2)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        print("A")
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data else { return }
            let decoder = JSONDecoder()
            do {
                let newsList = try decoder.decode(NetworkCall.self, from: data)
                print("B")
                DispatchQueue.main.async {
                    delegate?.newsListLoaded(newsList: newsList.articles)
                }
            } catch {
                print(error)
            }
        }
        print("C")
        dataTask.resume()
    }

}
