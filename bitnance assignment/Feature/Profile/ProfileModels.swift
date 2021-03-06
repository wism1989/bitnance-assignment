//
//  ProfileModels.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ProfileInfoType: Int {
    case list = 0
    case imageGrid
}

enum TableViewSectionType: Int {
    case header = 0
    case tab
    case content
}

enum Profile
{
  // MARK: Use cases
  
  enum GetNews
  {
    struct Response
    {
        let profileResult: Articles?
        let newsResult: [Articles]?
        let imageCellSize: CGSize
    }
    struct ViewModel
    {
        var errorCode: Int!
        var errorMessage: String!
        let displayProfile: DisplayProfile
        let displayNewsList: [DisplayNews]
        let imageCellSize: CGSize
        let cellDynamicHeight: CGFloat
    }
  }
}

extension Profile.GetNews.ViewModel {
    struct DisplayProfile {
        let profileImageURL: URL?
        let fullname: String
        let profileTypeName: String
        let profileDescription: String
    }
    
    struct DisplayNews {
        let newsImageURL: URL?
        let title: String
        let description: String
    }
}
