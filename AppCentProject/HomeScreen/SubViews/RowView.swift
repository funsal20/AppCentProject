//
//  RowView.swift
//  AppCentProject
//
//  Created by Tarık MacBook on 14.05.2024.
//

import SwiftUI

struct RowView: View {

    private let news: News
    init(news: News) {
        self.news = news
    }

    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing:10) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(news.description ?? "-")
                    .font(.footnote)
                    .lineLimit(2)
            }
            Spacer()
            AsyncImage(url:URL(string: news.urlToImage ?? "x")) { image in
                if let image = image.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
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
            .padding()
            .frame(width: 50, height: 50)
        }
    }
}


#Preview {
    RowView(news: News(source: ["" : ""], author: "", title: "Selam", description: "", url: "", urlToImage: "https://cdn.shopify.com/app-store/listing_images/6cfbc5cd395dd9c7c344e4f66a461ba7/promotional_image/CPKln_ukgP0CEAE=.png?height=720&width=1280", publishedAt: "", content: "sadfasdfasdfasfsafasfasfasasdfasdfsafsafsafasfsafsafsafsafsafsfdsdfasfasdfsafsdafsadfsadfsdfdsafasdfdsfsfdsfsfsa"))
}
