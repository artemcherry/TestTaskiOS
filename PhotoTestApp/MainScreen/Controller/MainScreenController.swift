//
//  MainScreen.swift
//  PhotoTestApp
//
//  Created by Артем Вишняков on 10.03.2022.
//

import UIKit

class MainScreenController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var photos: [PhotoModel]? = []
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotos(page: page)
    }

    private func getPhotos(page: Int) {
        NetworkManager.getData(urlString: "https://picsum.photos/v2/list?page=\(page)&limit=10") { data, error in
            DispatchQueue.main.async {
                self.photos?.append(contentsOf: data ?? [])
                self.collectionView.reloadData()
            }
        }
    }
}

extension MainScreenController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainScreenCell,
              let photos = photos
        else { return UICollectionViewCell() }
        cell.setupCell(model: photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let descriptionVC = storyboard
                .instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController,
              let photoInfo = photos?[indexPath.row]
        else { return }
        descriptionVC.photoInfo = photoInfo
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    //MARK: - Pagination
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if(scrollView.contentOffset.y >= (collectionView.contentSize.height - scrollView.frame.size.height )) {
                page += 1
                getPhotos(page: page)
            }
        }
    
    
}

