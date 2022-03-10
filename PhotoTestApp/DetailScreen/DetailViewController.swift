//
//  DetailViewController.swift
//  PhotoTestApp
//
//  Created by Артем Вишняков on 10.03.2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    var photoInfo = PhotoModel(author: nil, downloadUrl: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        authorLabel.text = photoInfo.author
        guard let url = URL(string: photoInfo.downloadUrl ?? "") else { return }
        imageView.sd_setImage(with: url, completed: nil)
    }
}

