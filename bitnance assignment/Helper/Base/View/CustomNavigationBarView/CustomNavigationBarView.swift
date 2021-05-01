//
//  CustomNavigationBarView.swift
//  foxclub-ios
//
//  Created by Wisarut Multhonggad on 10/21/20.
//

import UIKit

protocol CustomNavigationBarProtocol: AnyObject {
    func backPressed()
    func cartPressed()
    func sharePressed()
    func menuPressed()
}

extension CustomNavigationBarProtocol {
    func sharePressed() {
    }
}

class CustomNavigationBarView: UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var scanQRButton: UIButton!
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var cartLabel: UILabel!
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextFieldRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var languageButtonRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var rightStackView: UIStackView!
    
    weak var presentingController: UINavigationController?
    weak var delegate: CustomNavigationBarProtocol?
    var searchText: String = ""
    
    var needConfigCallbackButtons: [NaviagtionButtonType] = [.back]

    enum NaviagtionButtonType: Int {
        case profile = 1
        case searchTextField
        case scanQR
        case back
        case cart
        case chat
        case search
        case language
        case share
        case title
        case slideMenu
    }
    
    class func instanceFromNib() -> CustomNavigationBarView? {
        let navigationBarView = UINib(nibName: "CustomNavigationBarView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as? CustomNavigationBarView
        return navigationBarView
    }
    
    func configure(with buttonTypes: [NaviagtionButtonType],
                   parentView: UIView,
                   navigation: UINavigationController? = nil,
                   title: String = "",
                   subTitle: String? = nil,
                   titleAligment: NSTextAlignment? = nil,
                   hideLine: Bool = false,
                   height: CGFloat = defaultNavigationViewHeight) {
        backgroundColor = UIColor.CIColor.barColor
        self.backgroundView.backgroundColor = UIColor.CIColor.barColor
        self.presentingController = navigation
        lineView.isHidden = hideLine
        // Show buttons
        buttonTypes.forEach { [weak self] (buttonType) in
            let tag = buttonType.rawValue
            if let view = self?.backgroundView.viewWithTag(tag) {
                view.isHidden = false
            }
        }
        if buttonTypes.contains(.back) || buttonTypes.contains(.slideMenu) {
            rightStackView.isHidden = false
        }
        
        // Set constraint
        if buttonTypes.contains(.searchTextField) && !buttonTypes.contains(.profile) {
            searchViewLeftConstraint.constant = 16
        }
        if buttonTypes.contains(.searchTextField) && buttonTypes.contains(.back) {
            //searchViewLeftConstraint.constant = backButton.width
        }
        if buttonTypes.contains(.title) && buttonTypes.contains(.back) {
            //titleLabelLeftConstraint.constant = backButton.width
        }
        if buttonTypes.contains(.language) && !buttonTypes.contains(.chat) {
            languageButtonRightConstraint.constant = 16
        }
        if let titleAligment = titleAligment {
            titleLabelLeftConstraint.constant = 16
            titleLabelRightConstraint.constant = 16
            titleLabel.textAlignment = titleAligment
        }
        if buttonTypes.contains(.searchTextField) && buttonTypes.contains(.back) {
            //searchViewLeftConstraint.constant = backButton.width
        }
        parentView.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: parentView.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: parentView.rightAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
        
        // Set Title
        configureTitle(with: title, subTitle: subTitle)
    }
    
    override func layoutSubviews() {
        //profileImageView.image = profileImagePlaceholder
//        profileImageView.addBorder(radius: profileImageView.size.width / 2, color: .lightGrayColor, width: 2)
//        titleLabel.font = StyleKit.appFont(with: .xxl, and: .medium)
//        titleLabel.font = StyleKit.appFont(with: .xxl, and: .medium)
//        cartLabel.font = StyleKit.appFont(with: .xSmall, and: .medium)
//        chatLabel.font = StyleKit.appFont(with: .xSmall, and: .medium)
//        searchTextField.font = StyleKit.appFont(with: .large, and: .book)
//        languageButton.titleLabel?.font = StyleKit.appFont(with: .medium, and: .medium)
//        languageButton.setTitleForAllStates(AppConfig.shared.language.uppercased())
//        languageButton.titleColorForNormal = StyleKit.black87Color
//        languageButton.backgroundColor = StyleKit.lightGrayColor
//        languageButton.contentEdgeInsets = UIEdgeInsets(top: 3, left: 2.5, bottom: 1, right: 2.5)
//        languageView.addRoundCorners()
        
//        if parentViewController is ProductListViewController {
//            searchTextFieldRightConstraint.constant = 8
//        }
        
        updateCartBadge()
        displayProfileImage()
        updateProfileBadge()
        configureRx()
    }
    
    func configureTitle(with title: String, subTitle: String?) {
        titleLabel.text = title
    }

    func configureRx() {
        
    }
    
    func updateCartBadge() {
        
    }
    
    func updateProfileBadge() {

    }

    func displayProfileImage() {
//        if let user = ActiveUser.shared.currentUser, let imagepath = user.profileImageURL {
//            profileImageView.kf.setImage(
//                with: imagepath,
//                placeholder: profileImagePlaceholder,
//                options: [
//                    .forceRefresh
//                ]
//            )
//        } else {
//            profileImageView.image = profileImagePlaceholder
//        }
    }
    
    func configCallbackButton(buttonType: NaviagtionButtonType) -> Bool {
         return needConfigCallbackButtons.contains(where: {$0 == buttonType})
    }

    @IBAction func profilePressed(_ sender: Any) {
        
    }
    
    @IBAction func scanQRPressed(_ sender: Any) {
        
    }
    
    @IBAction func cartPressed(_ sender: Any) {
        
    }
    
    @IBAction func chatPressed(_ sender: Any) {
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
//        guard let delegate = delegate  else {
//            presentingController?.popViewController(animated: false)
//            return
//        }
//        if self.configCallbackButton(buttonType: .back) {
//            delegate.backPressed()
//        } else {
//            presentingController?.popViewController(animated: false)
//        }
    }
    
    @IBAction func searchIconPressed(_ sender: Any) {
        //navigateToSearch()
    }
    
    @IBAction func sharePressed(_ sender: Any) {
        delegate?.sharePressed()
    }
    
    @IBAction func menuPressed(_ sender: Any) {
        delegate?.menuPressed()
    }
}

extension CustomNavigationBarView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //searchTextFieldPressed()
        return false
    }
}
