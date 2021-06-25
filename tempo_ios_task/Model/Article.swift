//
//  Article.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}


struct CustomArticleViewModel {
    let imageUrl: URL?
    let sourceNameText: String?
    let autherText: String?
    let titleText: String?
    let descriptionText: String?
    let sourceUrl: URL?
    let dateText: String?
    let contentText: String?
    
    
    init(_ model: Article) {
        imageUrl = URL(string: model.urlToImage?.safeUrl ?? "")
        sourceNameText = "Source: \(model.source?.name ?? "")"
        autherText = "Auther: \(model.author ?? "")"
        titleText = model.title
        descriptionText = "Description \n\n\(model.description ?? "")"
        sourceUrl = URL(string: model.url?.safeUrl ?? "")
        contentText = "Content \n\n\(model.content ?? "")"
        dateText = (model.publishedAt ?? "").convertToDateFormate(with: "EEEE, MMM d, yyyy")
    }
}

