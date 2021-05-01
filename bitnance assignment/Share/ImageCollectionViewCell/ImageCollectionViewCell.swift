//
//  ImageCollectionViewCell.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: ImageCollectionViewCell.identifier(), bundle: nil)
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func settingImageCell(imageUrl: URL?) {
        if let url = imageUrl {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(
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
                            self.imageView.backgroundColor = .white
                            self.imageView.image = UIImage(named: "image_network_placeholder")
                        }
                    })
        } else {
            imageView.backgroundColor = .white
            imageView.image = UIImage(named: "image_network_placeholder")
        }
    }

}
