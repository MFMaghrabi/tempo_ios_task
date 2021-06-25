//  
//  ArticlesVC.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

class ArticlesVC: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet var articlesTableView: UITableView! {
        didSet {
            articlesTableView.register(UINib(nibName: ArticleCell.identifier, bundle: nil), forCellReuseIdentifier: ArticleCell.identifier)
            articlesTableView.delegate = self
            articlesTableView.dataSource = self
        }
    }
    
    
    //MARK: - Varibles
    var presenter: ArticlesPresenterProtocol!
    let search = UISearchController(searchResultsController: nil)
    
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_: Bool) {

     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        setupLayout()
        setLocalization()
    }
    
    
    //MARK: - setup Layoutout
    private func setupLayout() {
        self.navigationItem.title = "Articles"
        
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
    }
    
    //MARK: - set Localize For Controllers
    private func setLocalization(){
        
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (articlesTableView.contentOffset.y + articlesTableView.frame.size.height) >= articlesTableView.contentSize.height - 20 {
            presenter.paginationHit()
        }
    }

    
    
    // MARK: IBActions
    
}


extension ArticlesVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.SearchTextDidChange(searchController.searchBar.text)
    }
}


extension ArticlesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
        presenter.configure(cell: cell, index: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItemAtIndex(indexPath.item)
    }
}
