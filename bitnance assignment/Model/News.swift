//
//  News.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import ObjectMapper

struct News : Mappable {
	var status : String?
	var totalResults : Int?
	var articles : [Articles]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		status <- map["status"]
		totalResults <- map["totalResults"]
		articles <- map["articles"]
	}

}
