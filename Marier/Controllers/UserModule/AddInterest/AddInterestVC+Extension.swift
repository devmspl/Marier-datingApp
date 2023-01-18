//
//  AddInterestVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation
import UIKit

extension AddInterestVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.interestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = chipCollection.dequeueReusableCell(withReuseIdentifier: "ChipCollectionCell", for: indexPath) as! ChipCollectionCell
        cell.chiptext.text = viewModel.interestArray[indexPath.item].type
        if #available(iOS 16.0, *) {
            if viewModel.selectedIndex.contains(indexPath.item){
                cell.chipView.backgroundColor = UIColor(named: "lowerGradientColor")
            }else{
                cell.chipView.backgroundColor = UIColor(named: "buttonColor")
            }
        } else {
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let strData = viewModel.interestArray[indexPath.item].id

        if #available(iOS 16.0, *) {
            if viewModel.selectedIndex.contains(indexPath.item) {
                //
                if let currIndex =  viewModel.selectedIndex.firstIndex(of: indexPath.item) {// if it contains the index then delete from array
                    viewModel.selectedIndex.remove(at: currIndex)
                    viewModel.selectedInterests.remove(at: currIndex)
                           }
                print(indexPath.item,viewModel.selectedInterests,viewModel.selectedIndex)
                
            }
            else {
                viewModel.selectedIndex.append(indexPath.item)
                viewModel.selectedInterests.append(strData)
                print(indexPath.item,viewModel.selectedInterests)
            }
        } else {
            // Fallback on earlier versions
        }
                collectionView.reloadData()
    }
   
    
}
