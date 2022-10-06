//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Aleksey on 06.10.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return layout
    }()
    
    private lazy var photoGalleryCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DeafaultCell")
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.title = "Photo Gallery"
        
        view.backgroundColor = .white
        
        addViews()
        addConstraints()
    }
    
    func addViews() {
        view.addSubview(photoGalleryCollectionView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            self.photoGalleryCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.photoGalleryCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.photoGalleryCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.photoGalleryCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        cell.setupImage(whith: "\(itemData[indexPath.row])")
                
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemSizeInCollection, height: itemSizeInCollection)
    }
}
