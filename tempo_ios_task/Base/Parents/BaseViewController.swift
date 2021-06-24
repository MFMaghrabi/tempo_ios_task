//
//  BaseViewController.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    var compilation: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initializeNavigationBarAppearanceWithBack(_ callback: (() -> ())? = nil ) {
        self.navigationItem.hidesBackButton = true
        let button = UIButton(type: .custom)
        let back = UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate)
        button.setImage(back, for: .normal)
        if callback != nil {
            compilation = callback
            button.addTarget(self, action: #selector(handleCompilation), for: .touchUpInside)
        }else{
            button.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        }
        button.tintColor = UIColor.black
        button.imageView?.contentMode = .scaleAspectFit
        let buttonBar = UIBarButtonItem(customView: button)
        self.navigationItem.setLeftBarButtonItems([buttonBar], animated: true)
    }
    
    @objc func handleCompilation(){
        DispatchQueue.main.async {
            self.compilation?()
        }
    }
    
    @objc func popViewController() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

