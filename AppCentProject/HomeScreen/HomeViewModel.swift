//
//  HomeViewModel.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import Foundation
import SwiftData

class HomeViewModel: ObservableObject {
    @Published var search: String = ""
    @Published var newsList: [News] = []
    @Published var favNewsList: [News] = []

    private var dataSource = NewsDataSource()
    
    
    init() {
        dataSource.delegate = self
    }
    
    func searchAction() {
        dataSource.searchWord = search
    }
    
    func loadNewsList() {
        dataSource.loadNewsList()
    }
}




extension HomeViewModel: NewsDataSourceDelegate {

    func newsListLoaded(newsList: [News]) {
        self.newsList = newsList
    }
}
