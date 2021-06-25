//  
//  ArticlesPresenter.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//
import Foundation
class ArticlesPresenter {
    
    weak var coordinator: ArticlesPresenterDelegate?
    weak var view: ArticlesViewProtocol?
    private let interactor: ArticlesInteractorInputProtocol
    private var articles = [CustomArticleViewModel]()
    private var filter = PaginationFilter()
    private var totalItemsCount = 0
    private var isPaginationRequired: Bool  {
        return totalItemsCount > articles.count  
    }
    
    
    init(view: ArticlesViewProtocol, interactor: ArticlesInteractorInputProtocol) {
         self.view = view
         self.interactor = interactor
     }
    
    
    private func getArticles(){
        view?.showLoading()
        interactor.getArticles(filter: filter)
    }
}


// MARK: ArticlesPresentaion Protocol
extension ArticlesPresenter: ArticlesPresenterProtocol {
    
    func onViewDidLoad(){
        getArticles()
    }
    
    var numberOfItems: Int {
        articles.count
    }
    
    func configure(cell: ArticleCellView, index: Int) {
        cell.configure(viewModel: articles[index])
    }
    
    func didSelectItemAtIndex(_ index: Int) {
        coordinator?.loadArticleDetails(with: articles[index])
    }
    
    
    func SearchTextDidChange(_ text: String?) {
        filter.searchText = text
        filter.pageIndex = 1
        getArticles()
    }
    
    func paginationHit() {
        guard isPaginationRequired else {return}
        filter.pageIndex += 1
        getArticles()
    }
    
}


// MARK: ArticlesInteractor Output Protocol
extension ArticlesPresenter: ArticlesInteractorOutputProtocol {
    func getArticlesFetchedSuccessfully(response: BaseResponse<[Article]>) {
        view?.hideLoading()
        
        guard let data = response.data else {
            view?.showAlert(title: "Alert", message: response.message ?? NetworkError.SomeThingWentWrong.rawValue)
            return
        }
        
        if filter.pageIndex == 1 {
            articles.removeAll()
        }
        
        articles += data.map(CustomArticleViewModel.init)
        
        totalItemsCount = response.totalResults ?? 0
        
        view?.reloadTableView()
    }
    
    func getArticlesFetchingFailed(withError error: NetworkError) {
        view?.hideLoading()
        view?.showAlert(title: "Alert", message: error.rawValue)
    }
    
}
