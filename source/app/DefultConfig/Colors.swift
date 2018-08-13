//
//  Colors.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

enum Colors {

	case blackDefatult
	case viewTitle
	case movieTitle

	var value: UIColor {

		switch self {
		case .blackDefatult:
			return UIColor(red: 47.0/255.0, green: 47.0/255.0, blue: 47.0/255.0, alpha: 1.0)
		case .viewTitle:
			return UIColor.orange
		case .movieTitle:
			return UIColor.white

		}
	}
}
