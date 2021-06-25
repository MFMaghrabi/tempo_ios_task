//  
//  ArticlesConfigurator.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

class ArticlesConfigurator{
    
    /// Returns viewController, configured with its associated presenter.
    func configuredViewController(delegate: ArticlesPresenterDelegate?) -> ArticlesVC {
        let viewController = ArticlesVC()
        let interactor = ArticlesInteractor()
        let presenter = ArticlesPresenter(view: viewController, interactor: interactor)
        presenter.coordinator = delegate
        viewController.presenter =  presenter
        interactor.presenter = presenter
        return viewController
    }
}
