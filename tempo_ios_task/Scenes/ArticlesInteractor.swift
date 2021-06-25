//  
//  ArticlesInteractor.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

class ArticlesInteractor: ArticlesInteractorInputProtocol {
    
    weak var presenter: ArticlesInteractorOutputProtocol?
    //MARK: - Create Your private Worker
    let articlesWorker = ArticleWorker()
    
    
    func getArticles(filter: PaginationFilter) {
        articlesWorker.getArticles(filter: filter) { [weak self] (result) in
            DispatchQueue.main.async {
            guard let self = self else { return }
            switch result {
            case .success(let response):
                    self.presenter?.getArticlesFetchedSuccessfully(response: response)
            case .failure(let error):
                    self.presenter?.getArticlesFetchingFailed(withError: error)
                }
            }
        }
    }
}
