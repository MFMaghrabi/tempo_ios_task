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
    let id: Int?
    let name: String?
}

