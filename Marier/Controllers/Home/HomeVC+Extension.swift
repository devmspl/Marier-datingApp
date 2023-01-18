//
//  HomeVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation
import Koloda

extension HomeVC: KolodaViewDelegate,KolodaViewDataSource{
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        let cards = (Bundle.main.loadNibNamed("CardView", owner: self, options: nil)?[0] as! CardView)
        return cards
    }
    
    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        10
    }
    
}
