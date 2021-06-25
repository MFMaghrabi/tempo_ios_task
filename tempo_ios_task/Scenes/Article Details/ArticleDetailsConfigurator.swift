//  
//  ArticleDetailsConfigurator.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

class ArticleDetailsConfigurator{
    
    /// Returns viewController, configured with its associated presenter.
    func configuredViewController(delegate: ArticleDetailsPresenterDelegate?, with article: CustomArticleViewModel) -> ArticleDetailsVC {
        let viewController = ArticleDetailsVC()
        let interactor = ArticleDetailsInteractor()
        let presenter = ArticleDetailsPresenter(view: viewController, interactor: interactor, article: article)
        presenter.coordinator = delegate
        viewController.presenter =  presenter
        interactor.presenter = presenter
        return viewController
    }
}
