//
//  UITableViewControllerExtensions.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit

extension UICollectionViewController {

	func showMessageTableEmpty(text: String, amount: Int, collectionView: UICollectionView ) -> Int{

		let message = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))

		if amount == 0 {

			message.isHidden = false
			message.textAlignment = .center
			message.numberOfLines = 0
			message.textColor = .gray
			message.font = UIFont(name: "Consolas", size: 18)
			message.text = text
			message.sizeToFit()

			collectionView.backgroundView = message

			return 0

		} else {

			collectionView.backgroundView = UIView()

			return amount
		}
	}
}
