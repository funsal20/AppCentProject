//
//  NewsDetailView.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 15.05.2024.
//

import SwiftUI
import WebKit

struct NewsDetailView: View {

    @ObservedObject var viewModel: NewsDetailViewModel
    @ObservedObject var homeViewModel: HomeViewModel

    init(viewModel: NewsDetailViewModel, homeViewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.homeViewModel = homeViewModel
    }

    var body: some View {
        VStack {
            imageView
            Text(viewModel.news.title)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            HStack {
                HStack {
                    Image(systemName: "person")
                    Text(viewModel.news.author ?? "-")
                        .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                }
                .padding()
                Spacer()
                HStack {
                    Image(systemName: "calendar")
                    Text(viewModel.filterDate(date: viewModel.news.publishedAt))
                        .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                }
                .padding()
            }
            ScrollView {
                Text(viewModel.news.content)
                    .padding()
            }
            Spacer()
            NavigationLink {
                WebView(news: viewModel.news)
                    .navigationTitle("News Source")
            } label: {
                Text("News Source")
                    .font(.body)
                    .foregroundColor(Color.black)
                    .padding(8)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            }

        }
        .navigationBarItems(
            trailing: HStack {
                ShareLink(item: URL(string: viewModel.news.url)!) {
                    Image(systemName: "square.and.arrow.up")
                }
                Button(action: {
                    viewModel.news.isFavorite.toggle()
                    
                    if viewModel.news.isFavorite && !homeViewModel.favNewsList.contains(viewModel.news)  {
                        homeViewModel.favNewsList.append(viewModel.news)
                    }

                    if  !viewModel.news.isFavorite && homeViewModel.favNewsList.contains(viewModel.news)  {
                        if let index = homeViewModel.favNewsList.firstIndex(where: { $0.id == viewModel.news.id }) {
                               homeViewModel.favNewsList.remove(at: index)
                           }
                    }
                }) {
                    if homeViewModel.favNewsList.contains(viewModel.news){
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
            }
        )

    }


    private var imageView: some View {
        AsyncImage(url:URL(string: viewModel.news.urlToImage ?? "x")) { image in
            if let image = image.image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else if image.error != nil {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
            } else {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

struct WebView: UIViewRepresentable {

    var news: News
    let webView: WKWebView

    init(news: News) {
        webView = WKWebView(frame: .zero)
        self.news = news

    }

    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        webView.load(URLRequest(url: URL(string: news.url) ?? URL(string: "https://google.com")!))
    }
}

#Preview {
    NewsDetailView(viewModel: NewsDetailViewModel(news: News(
        source: ["id": "example", "name": "Example Source"],
        author: "John Doe",
        title: "Example News Title",
        description: "Example description of the news.",
        url: "https://example.com",
        urlToImage: "https://example.com/image.jpg",
        publishedAt: "2023-01-01T00:00:00Z",
        content: "Example content of the news."
    )), homeViewModel: HomeViewModel())
}

