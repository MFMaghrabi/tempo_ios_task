//
//  ArticleCell.swift
//  tempo_ios_task
//
//  Created by MohammadMaghrabi on 25/06/2021.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    static let identifier = "ArticleCell"
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autherLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}


extension ArticleCell: ArticleCellView {
    func configure(viewModel: CustomArticleViewModel) {
        
        articleImage.showActivityLoader()
        articleImage.kf.setImage(with: viewModel.imageUrl)
        
        titleLabel.text = viewModel.titleText
        
        autherLabel.text = viewModel.autherText
    }
}

