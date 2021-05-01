//
//  NewsTableViewCell.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var imageViewConstraintHeight: NSLayoutConstraint!
    
    static func nib() -> UINib {
        return UINib(nibName: NewsTableViewCell.identifier(), bundle: nil)
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func settingNewsCell(viewModel: Profile.GetNews.ViewModel.DisplayNews) {
        if let url = viewModel.newsImageURL {
            newsImageView.isHidden = false
            imageViewConstraintHeight.constant = 105
            newsImageView.kf.indicatorType = .activity
            newsImageView.kf.setImage(
                with: url,
                placeholder: UIImage(named: "image_network_placeholder"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ], completionHandler:
                    {
                        result in
                        switch result {
                        case .success(let value):
                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                        case .failure(let error):
                            print("Job failed: \(error.localizedDescription)")
                            self.newsImageView.image = UIImage(named: "image_network_placeholder")
                        }
                    })
        } else {
            newsImageView.isHidden = true
            imageViewConstraintHeight.constant = 0
        }
        
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
