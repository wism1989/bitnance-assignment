//
//  NewsService.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//

import Foundation
import Moya

enum NewsServive {
    case getTopHeadlinesNews(body: [String: Any])
}

extension NewsServive: TargetType {
    var baseURL: URL {
        return URL(string: ROOT_URL)!
    }
    
    var path: String {
        "top-headlines"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .getTopHeadlinesNews(let body):
            return .requestParameters(parameters: body, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
}
