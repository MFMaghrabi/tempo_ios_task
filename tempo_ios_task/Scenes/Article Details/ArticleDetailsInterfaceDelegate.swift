//  
//  ArticleDetailsInterfaceDelegate.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

extension ArticleDetailsVC: ArticleDetailsViewProtocol {
    
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
    
    
    
    func updateUI(with article: CustomArticleViewModel) {
        
        articaleImage.kf.setImage(with: article.imageUrl)
        
        titleLabel.text = article.titleText
        
        autherLabel.text = article.autherText
        
        dateLabel.text = article.dateText
        
        sourceLabel.text = article.sourceNameText
        
        descriptionLabel.text = article.descriptionText
        
        contentLabel.text = article.contentText
        
    }
    
    
    func navigateToSource(with link: URL) {
        UIApplication.shared.open(link)
    }
    
}
