//
//  Routes.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import Foundation

enum Routes {

	case moviesList

	var file: String {

		switch self {
		case .moviesList:
			return "MoviesListView"
		}
	}
}
