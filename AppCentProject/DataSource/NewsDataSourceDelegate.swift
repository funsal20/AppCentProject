//
//  NewsDataSourceDelegate.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import Foundation

protocol NewsDataSourceDelegate {
    func newsListLoaded(newsList: [News])
}
