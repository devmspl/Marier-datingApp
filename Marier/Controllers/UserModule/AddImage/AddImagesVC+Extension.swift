//
//  AddImagesVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 19/01/23.
//

import Foundation
import UIKit
import OpalImagePicker
import Photos


extension AddImagesVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,OpalImagePickerControllerDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if viewModel.arrayData.count > 0{
            return viewModel.arrayData.count
        }else{
            return 4
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
        if viewModel.arrayData.count == 2{
            return CGSize(width: picCollection.frame.width/2, height: picCollection.frame.height/1.5)
        }else {
            return CGSize(width: picCollection.frame.width/2, height: picCollection.frame.height/2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.present(picker, animated: true)

    }
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingAssets assets: [PHAsset]) {
        print(assets)
        let validationResult = CheckImages().check(images: assets)
        if validationResult.success{
            ConvertAsset().toImage(asset: assets){images in
                self.viewModel.arrayData = images
                self.picker.dismiss(animated: true)
                self.picCollection.reloadData()
            }
          
        }else{
            self.picker.alert(message: validationResult.error)
        }
    }
    func imagePickerDidCancel(_ picker: OpalImagePickerController) {
        self.picker.dismiss(animated: true)
        
    }
    
}
