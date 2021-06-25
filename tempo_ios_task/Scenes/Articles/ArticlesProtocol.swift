//  
//  ArticlesProtocol.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import Foundation

protocol ArticlesViewProtocol: class {
    var presenter: ArticlesPresenterProtocol! { get set }
    func hideKeyboard()
    func showLoading()
    func hideLoading()
    func showAlert(title: String, message: String)
    func showAlert(title: String, message: String, completion: (() -> Void)?)
    func reloadTableView()
}



protocol ArticlesPresenterProtocol: class {
    var view: ArticlesViewProtocol? { get set }
    func onViewDidLoad()
    var numberOfItems: Int { get }
    func configure(cell: ArticleCellView, index: Int)
    func didSelectItemAtIndex(_ index: Int)
    func SearchTextDidChange(_ text: String?)
    func paginationHit()
}


protocol ArticlesPresenterDelegate: class {
    func loadArticleDetails(with article: CustomArticleViewModel)
}


protocol ArticlesInteractorInputProtocol {
    var presenter: ArticlesInteractorOutputProtocol? { get set }
    func getArticles(filter: PaginationFilter)
}


protocol ArticlesInteractorOutputProtocol: class {
    func getArticlesFetchedSuccessfully(response: BaseResponse<[Article]>)
    func getArticlesFetchingFailed(withError error: NetworkError)
}

// MARK: - set up your cellView Protocol Here , if needed.
protocol ArticleCellView {
    func configure(viewModel: CustomArticleViewModel)
}

