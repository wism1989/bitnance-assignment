//
//  ProjectHelper.swift
//  Spar
//
//  Created by Rut Nilecon on 26/11/2561 BE.
//  Copyright © 2561 Nilecon (Thailand) Co., Ltd. All rights reserved.
//

import UIKit

let ROOT_URL = "https://newsapi.org/v2/"
let DomainID = 2
let defaultNavigationViewHeight: CGFloat = 44.0
let defaultIndent: CGFloat = 10.0
let serverDateFormat = "dd-mm-yy"

enum ProjectHelper {
    struct KeyName {
        static let preferredThaiLanguage = "th-TH"
        static let switchLanguageFromNotification = "keySwitchLanguageDidChangeFromNotification"
        static let showRouteTabbarItemFromNotification = "showRouteTabbarItemDidChangeFromNotification"
        static let hidenRouteTabbarItemFromNotification = "hidenRouteTabbarItemDidChangeFromNotification"
        static let reloadFeederListFromNotification = "reloadFeederListDidChangeFromNotification"
        static let loadMarkMapFromNotification = "loadMarkMapDidChangeFromNotification"
        static let reloadMrtClubAfterLogout = "reloadMrtClubAfterLogoutFromNotification"
        static let saveStationGeotification = "saveStationGeotification"
        static let statusStationReminder = "statusStationReminder"
        static let didReciveDevicePushKitsToken = "didReciveDevicePushKitsToken"
        static let didAnswerCallFromRecive = "didAnswerCallFromRecive"
        static let didEndCallFromRecive = "didEndCallFromRecive"
        
        static let secureKey = ""
        static let userKey = ""
    }
    
    struct ThirdPaytyAPIs {
        static let googleAPIsKey = ""
        //static var MRT_Club_Token = WMRemoteConfigHelper.sharedInstance.string(forKey: .mrt_club_token)
        static let oneSignalAppID = ""
    }
    
    struct ImageCIName {
        static let googlePinName = "icon_pin_mrt"
        static let googlePinPupleName = "icon_pin_puple"
    }
}

extension UIColor {
    struct CIColor {
        static let barColor: UIColor = UIColor(named: "ci_bar")!
        static let viewColor: UIColor = UIColor(named: "ci_view")!
        static let fontColor: UIColor = UIColor(named: "ci_font")!
//        static let darkGradientBlue: UIColor = UIColor(hexString: "3C76C0")!
//        static let lightPuple: UIColor = UIColor(hexString: "AC9CCE")!
//        static let darkGradientPuple: UIColor = UIColor(hexString: "664E9C")!
//        static let blueLineColor: UIColor = UIColor(hexString: "0E4285")!
//        static let purpleLineColor: UIColor = UIColor(hexString: "664E9C")!
    }
}

extension CAGradientLayer {
    
    enum Point {
        case topRight, topLeft
        case bottomRight, bottomLeft
        case custion(point: CGPoint)
        
        var point: CGPoint {
            switch self {
            case .topRight: return CGPoint(x: 1, y: 0)
            case .topLeft: return CGPoint(x: 0, y: 0)
            case .bottomRight: return CGPoint(x: 1, y: 1)
            case .bottomLeft: return CGPoint(x: 0, y: 1)
            case .custion(let point): return point
            }
        }
    }
    
    convenience init(frame: CGRect, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        self.init()
        self.frame = frame
        self.colors = colors.map { $0.cgColor }
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    convenience init(frame: CGRect, colors: [UIColor], startPoint: Point, endPoint: Point) {
        self.init(frame: frame, colors: colors, startPoint: startPoint.point, endPoint: endPoint.point)
    }
    
    func createGradientImage() -> UIImage? {
        defer { UIGraphicsEndImageContext() }
        UIGraphicsBeginImageContext(bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UINavigationBar {
    func setGradientBackground(colors: [UIColor], startPoint: CAGradientLayer.Point = .topLeft, endPoint: CAGradientLayer.Point = .bottomLeft) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors, startPoint: startPoint, endPoint: endPoint)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundImage = gradientLayer.createGradientImage()
            appearance.titleTextAttributes = [
                .foregroundColor : UIColor.white,
                .font : UIFont(name: "RSU", size: 20) ?? UIFont.systemFont(ofSize: 18)
            ]
            appearance.setBackIndicatorImage(UIImage(named: "icon_back"), transitionMaskImage: UIImage(named: "icon_back"))
            self.scrollEdgeAppearance = appearance
            self.compactAppearance = appearance
            self.standardAppearance = appearance
        } else {
            setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
        }
    }
    
    func sizeHeight() -> CGFloat {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        return  updatedFrame.size.height
    }
}

extension UIImageView {
    func setViewGradient(colors: [UIColor], startPoint: CAGradientLayer.Point = .topLeft, endPoint: CAGradientLayer.Point = .bottomLeft) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors, startPoint: startPoint, endPoint: endPoint)
        image = gradientLayer.createGradientImage()
    }
}

extension UIView {
    func setViewColorGradient(colors: [UIColor], startPoint: CAGradientLayer.Point = .topLeft, endPoint: CAGradientLayer.Point = .bottomLeft) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors, startPoint: startPoint, endPoint: endPoint)
        let image = gradientLayer.createGradientImage()
        backgroundColor = UIColor(patternImage: image!)
    }
}

extension UIButton {
    func setViewGradient(colors: [UIColor], startPoint: CAGradientLayer.Point = .topLeft, endPoint: CAGradientLayer.Point = .bottomLeft) {
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors, startPoint: startPoint, endPoint: endPoint)
        setBackgroundImage(gradientLayer.createGradientImage(), for: .normal)
    }
}
