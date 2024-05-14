//
//  FavoritesView.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 15.05.2024.
//

import SwiftUI

struct FavoritesView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.favNewsList) { news in
                    NavigationLink {
                        NewsDetailView(viewModel: NewsDetailViewModel(news: news), homeViewModel: viewModel)
                    } label: {
                        RowView(news: news)
                    }
                    
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.automatic)

        }
    }
}
    #Preview {
        FavoritesView(viewModel: HomeViewModel())
    }
