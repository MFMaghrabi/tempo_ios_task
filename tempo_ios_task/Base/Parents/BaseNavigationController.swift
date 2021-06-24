//
//  BaseNavigationController.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initializeNavigationBarAppearance()

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    func initializeNavigationBarAppearance(){
        // bacground color for nav
        navigationBar.barTintColor = .white
        
        // colors for tint for items in nav
        navigationBar.tintColor = .black
    }
}
