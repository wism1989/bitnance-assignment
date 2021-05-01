//
//  LoadingView.swift
//  foxclub-ios
//
//  Created by Wisarut Multhonggad on 10/21/20.
//

import Foundation
import RSLoadingView
//import SnackBar_swift

class BaseViewController: UIViewController {
    var refreshControl = UIRefreshControl()
    private var loadingView: RSLoadingView?
    
    func showLoading() {
        loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView?.shouldTapToDismiss = true
        loadingView?.mainColor = UIColor.red
        loadingView?.dimBackgroundColor = UIColor.lightGray
        loadingView?.backgroundColor = UIColor.green
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        guard let windows = appdelegate.window else {
            loadingView = nil
            return
        }
        loadingView?.show(on: windows)
    }
    
    func hideLoading() {
        loadingView?.hide()
        loadingView = nil
    }
    
//    func showSnackBar(message: String, isError: Bool = false) {
//        if isError {
//            ErrorSnackBar.make(in: self.view, message: message, duration: .lengthShort).show()
//        } else {
//            ValidSnackBar.make(in: self.view, message: message, duration: .lengthShort).show()
//        }
//    }
}

//class ValidSnackBar: SnackBar {
//
//    override var style: SnackBarStyle {
//        var style = SnackBarStyle()
//        style.background = .systemGreen
//        style.textColor = .white
//        return style
//    }
//}
//
//class ErrorSnackBar: SnackBar {
//
//    override var style: SnackBarStyle {
//        var style = SnackBarStyle()
//        style.background = .red
//        style.textColor = .white
//        return style
//    }
//}

extension UIViewController {
    var topbarHeight: CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    
    func showAlert(withMessage message: String? , title: String? = nil , submitHandle: (()->())? = nil) {
        if message == nil || message == "" || message == " " {
            return
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            submitHandle?()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
