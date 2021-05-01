//
//  ProfileHeaderTableViewCell.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//

import UIKit
import Kingfisher

class ProfileHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var profileTypeLabel: UILabel!
    @IBOutlet weak var profileDetailLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: ProfileHeaderTableViewCell.identifier(), bundle: nil)
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func settingProfileCell(viewModel: Profile.GetNews.ViewModel.DisplayProfile) {
        settingUI()
        if let url = viewModel.profileImageURL {
            profileImageView.kf.indicatorType = .activity
            profileImageView.kf.setImage(
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
                            self.profileImageView.image = UIImage(named: "image_network_placeholder")
                        }
                    })
        } else {
            self.profileImageView.image = UIImage(named: "image_network_placeholder")
        }
        fullnameLabel.text = viewModel.fullname
        profileTypeLabel.text = viewModel.profileTypeName
        profileDetailLabel.text = viewModel.profileDescription
    }
    
    fileprivate func settingUI() {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        profileTypeLabel.layer.cornerRadius = profileTypeLabel.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
