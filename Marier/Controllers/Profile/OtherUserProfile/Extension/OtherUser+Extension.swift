//
//  File.swift
//  Marier
//
//  Created by MacBook M1 on 25/01/23.
//

import Foundation
import UIKit

extension OtherUserProfileVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == interestCollection{
            return viewModel.userData?.interests.count ?? 0
        }else if collectionView == orientationCollection{
            return viewModel.userData?.sexualOrientations.count ?? 0
        }else {
            return viewModel.userData?.gallery.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imageCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryImage
            cell.cellConfig(data: viewModel.userData!.gallery[indexPath.row]! )
            return cell
        }else if collectionView == interestCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipCollectionCell", for: indexPath) as! ChipCollectionCell
            cell.config(cellData: viewModel.userData!.interests)
            return cell
        }else if collectionView == orientationCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipCollectionCell", for: indexPath) as! ChipCollectionCell
            cell.config(cellData: viewModel.userData!.sexualOrientations)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionCell", for: indexPath) as! ImagesCollectionCell
            cell.config(data: viewModel.userData!.gallery)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == interestCollection || collectionView == orientationCollection{
            return CGSize(width: interestCollection.frame.width/2.8, height: interestCollection.frame.height)
        }else if collectionView == imageCollection{
            return CGSize(width: imageCollection.frame.width, height: imageCollection.frame.height)
        }else {
            return CGSize(width: galleryCollection.frame.width/2.5, height: galleryCollection.frame.height)
        }
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == imageCollection{
            self.pageControlV.currentPage = indexPath.section
        }
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        pageControlV.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
   
    
    
}
