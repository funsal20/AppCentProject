//
//  ContentView.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        TabView {
            newsView
                .tabItem {
                    Label("News", systemImage: "house")
                }
            FavoritesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }


    private var newsView: some View {
        NavigationStack{
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    TextField("Type a Text", text: $viewModel.search)
                        .padding(10)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(.systemGray), lineWidth: 1)
                        )
                    Spacer()
                    seacrhButton
                    Spacer()
                }
                Spacer()
                if viewModel.newsList.isEmpty {
                    ProgressView()
                        .onAppear {
                            viewModel.loadNewsList()
                        }
                } else {
                    NewsListView(viewModel: viewModel)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Appcent NewsApp")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }

    private var seacrhButton: some View {
        Button(action: {
            viewModel.searchAction()
            viewModel.loadNewsList()
        }) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(12)
                .background(Color(.systemGray))
                .cornerRadius(8)
        }
    }
}

#Preview {
    HomeView()

}
