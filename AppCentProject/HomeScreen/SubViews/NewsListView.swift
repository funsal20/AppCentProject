//
//  NewsListView.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import SwiftUI

struct NewsListView: View {

    @ObservedObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.newsList, id:\.self) { news in
            NavigationLink {
                NewsDetailView(viewModel: NewsDetailViewModel(news: news), homeViewModel: viewModel)
            } label: {
                RowView(news: news)
            }
        }
    }
}

#Preview {
    NewsListView(viewModel: HomeViewModel())
}
