//
//  AppCoordinator.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit


class AppCoordinator: Coordinator, ArticlesPresenterDelegate{
    
    // MARK: Properties
    var navigationController: UINavigationController
    
    // MARK: Public methods
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - start
    func start() {
        loadArticles()
    }
    
    // load Articles
    func loadArticles(){
        navigationController.pushViewController(ArticlesConfigurator().configuredViewController(delegate: self), animated: true)
    }
    
}

