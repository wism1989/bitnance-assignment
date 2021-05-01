//
//  NewsImageTableViewCell.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//

import UIKit

class NewsImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewConstraintHeight: NSLayoutConstraint!
    
    fileprivate var viewModel: Profile.GetNews.ViewModel?
    fileprivate var cellSize: CGSize = .zero
    
    static func nib() -> UINib {
        return UINib(nibName: NewsImageTableViewCell.identifier(), bundle: nil)
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCollectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier())
    }
    
    func settingProfileFeedCell(viewModel: Profile.GetNews.ViewModel?) {
        self.viewModel = viewModel
        cellSize = viewModel?.imageCellSize ?? .zero
        collectionViewConstraintHeight.constant = viewModel?.cellDynamicHeight ?? 0
        imageCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewsImageTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = viewModel?.displayNewsList else { return 0 }
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier(), for: indexPath) as! ImageCollectionViewCell
        if  let news = viewModel?.displayNewsList[indexPath.item] {
            cell.settingImageCell(imageUrl: news.newsImageURL)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { }
}

extension NewsImageTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
