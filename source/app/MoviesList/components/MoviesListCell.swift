//
//  MoviesListCell.swift
//  skymovies
//
//  Created by Tiago da Silva Amaral on 12/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesListCell: UICollectionViewCell {

	@IBOutlet private (set) weak var title: UILabel!
	@IBOutlet private (set) weak var cover: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		self.setApperance()
    }

	func setCell(with movie: Movie) {
		self.title.text = movie.title
		self.cover.kf.setImage(with: self.arrangeUrl(original: movie.cover_url), placeholder: UIImage(named: "placeholder"))
	}

	func arrangeUrl(original: URL) -> URL {
		let array = original.absoluteString.split(separator: "/")
		let photoId = array.last!
		return URL(string: "https://image.tmdb.org/t/p/w1280/" + photoId)!
	}

	func setApperance() {
		self.title.textColor =  Colors.movieTitle.value
	}

	func willRemove(){
		self.cover.kf.cancelDownloadTask()
	}
}
