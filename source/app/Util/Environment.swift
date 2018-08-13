//
//  Environment.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 11/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

struct Environment {

	var  current: EnvironmentFlag {

		guard let currentString = Bundle.main.infoDictionary?["Environment"] as? String else {
			fatalError("Environment not defined!")
		}

		switch currentString {
		case "debug":
			return .debug
		default:
			return .release
		}
	}
}

enum EnvironmentFlag {
	case debug
	case release
}
