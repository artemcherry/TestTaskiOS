//
//  MainScreenCell.swift
//  PhotoTestApp
//
//  Created by Артем Вишняков on 10.03.2022.
//

import UIKit
import SDWebImage

class MainScreenCell: UICollectionViewCell {
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var authorLabel: UILabel!
    
    func setupCell(model: PhotoModel) {
        guard let urlString = model.downloadUrl  else { return }
        let smallerImage = "\(urlString.dropLast(9))/600/400"
        guard let url = URL(string: smallerImage) else { return }
        image.sd_setImage(with: url, completed: nil)
        authorLabel.text = model.author ?? ""
    }
}
