//  
//  ArticleDetailsVC.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

class ArticleDetailsVC: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var articaleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autherLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    
    //MARK: - Varibles
    var presenter: ArticleDetailsPresenterProtocol!
    
    
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
        
    }
    
    //MARK: - set Localize For Controllers
    private func setLocalization(){
        
    }
    
    // MARK: IBActions
    @IBAction func navigateToSourceButtonTapped(){
        presenter.sourceButtonTapped() 
    }
}
