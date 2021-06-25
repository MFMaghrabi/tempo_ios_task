//  
//  ArticleDetailsProtocol.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

protocol ArticleDetailsViewProtocol: class {
    var presenter: ArticleDetailsPresenterProtocol! { get set }
    func hideKeyboard()
    func showLoading()
    func hideLoading()
    func showAlert(title: String, message: String)
    func showAlert(title: String, message: String, completion: (() -> Void)?)
    func updateUI(with article: CustomArticleViewModel)
    func navigateToSource(with link: URL)
}



protocol ArticleDetailsPresenterProtocol: class {
    var view: ArticleDetailsViewProtocol? { get set }
    func onViewDidLoad()
    func sourceButtonTapped()
}


protocol ArticleDetailsPresenterDelegate: class {
    
}


protocol ArticleDetailsInteractorInputProtocol {
    var presenter: ArticleDetailsInteractorOutputProtocol? { get set }
}


protocol ArticleDetailsInteractorOutputProtocol: class {
  
}

// MARK: - set up your cellView Protocol Here , if needed.

