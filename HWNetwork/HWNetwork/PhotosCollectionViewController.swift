//
//  PhotosCollectionViewController.swift
//  HWNetwork
//
//  Created by Алексей on 21.08.2023.
//


import UIKit



final class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo"
        collectionView.register(MyPhotoCell.self, forCellWithReuseIdentifier: "photoCell")
    }
    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! MyPhotoCell
        return cell
    }
}
    extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout
{
        func collectionView (_ collectionView: UICollectionView, layout
                            collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = UIScreen.main.bounds.width
            let cellSize = width / 2 - 20
            return CGSize(width: cellSize, height: cellSize)
    }
}


