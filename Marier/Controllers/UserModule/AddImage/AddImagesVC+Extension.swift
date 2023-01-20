//
//  AddImagesVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 19/01/23.
//

import Foundation
import UIKit

extension AddImagesVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.arrayData.count > 0{
            return viewModel.arrayData.count
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = picCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PicCollectionCell
        guard viewModel.arrayData.count != 0 else {return cell}
        cell.plusBtn.isHidden = true
        cell.cellImage.image = viewModel.arrayData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: picCollection.frame.width/2.1, height: picCollection.frame.height/2.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openCameraAndPhotos(isEditImage: true) { [self] image, message in
            print(message)
           viewModel.arrayData.removeAll()
            for i in 0...3{
                print(i)
                viewModel.arrayData.append(image)
            }
          
            picCollection.reloadData()
        } failure: { error in
            print(error)
        }

    }
    
    
}
