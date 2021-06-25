//  
//  ArticlesInterfaceDelegate.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

extension ArticlesVC: ArticlesViewProtocol {
    
    
    func hideKeyboard() {
        dismissKeyboard()
    }
    
    func showLoading() {
        view.showHUD(backgroundColor: .clear, tintColor: .black, animated: true)
    }
    
    func hideLoading() {
        view.hideHUD(animated: true)
    }
    
    func showAlert(title: String, message: String) {
        presentAlert(title: title, message: message)
    }
    
    func showAlert(title: String, message: String, completion: (() -> Void)?) {
        presentAlert(title: title, message: message, defaultButtonTitle: "okay", appendSecondAction: true) {
            completion?()
        }
    }
    
    func reloadTableView(){
        articlesTableView.reloadData()
    }
    
}
