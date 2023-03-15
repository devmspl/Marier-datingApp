//
//  PremiumVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 02/03/23.
//

import Foundation
import UIKit

extension PremiumVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == premiumBenifitsCollection{
            return 7
        }else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == premiumBenifitsCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionBenifitCell", for: indexPath) as! SubscriptionBenifitCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionCell", for: indexPath) as! SubscriptionCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == premiumBenifitsCollection{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else{
            return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
        }
        
    }
    
}
