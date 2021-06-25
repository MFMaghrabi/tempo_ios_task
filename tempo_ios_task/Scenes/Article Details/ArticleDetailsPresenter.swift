//  
//  ArticleDetailsPresenter.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//
import Foundation
class ArticleDetailsPresenter {
    
    weak var coordinator: ArticleDetailsPresenterDelegate?
    weak var view: ArticleDetailsViewProtocol?
    private let interactor: ArticleDetailsInteractorInputProtocol
    private let article: CustomArticleViewModel?
    
    
    init(view: ArticleDetailsViewProtocol, interactor: ArticleDetailsInteractorInputProtocol, article: CustomArticleViewModel) {
        self.view = view
        self.interactor = interactor
        self.article = article
    }
    
}


// MARK: ArticleDetailsPresentaion Protocol
extension ArticleDetailsPresenter: ArticleDetailsPresenterProtocol {
    
    func onViewDidLoad(){
        guard let article = article else {return}
        view?.updateUI(with: article)
    }
    
    func sourceButtonTapped() {
        guard let article = article else {return}
        guard let url = article.sourceUrl else {return}
        view?.navigateToSource(with: url)
    }
}


// MARK: ArticleDetailsInteractor Output Protocol
extension ArticleDetailsPresenter: ArticleDetailsInteractorOutputProtocol {
    
    
}
