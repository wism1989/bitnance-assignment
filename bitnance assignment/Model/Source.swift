//
//  Source.swift
//  bitnance assignment
//
//  Created by Wisarut Multhonggad on 5/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import ObjectMapper

struct Source : Mappable {
	var id : String?
	var name : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
	}

}
