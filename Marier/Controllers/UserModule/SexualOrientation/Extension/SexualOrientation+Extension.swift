//
//  SexualOrientation+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import Foundation
import UIKit

extension SexualOrientationVC: UITableViewDelegate,UITableViewDataSource{
    //Number of row in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orientationList.count
    }
  ///
    //CellFor row at
    ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orientationTable.dequeueReusableCell(withIdentifier: "cell") as! OreintationCell
        
        cell.orientationLabel.text = viewModel.orientationList[indexPath.row].type
        if #available(iOS 16.0, *) {
            if viewModel.selectedIndex.contains(indexPath.item){
                cell.backgroundColor = UIColor(named: "lowerGradientColor")
            }else{
                cell.backgroundColor = .white
            }
        } else {
        }
        return cell
    }
    ///
    //DidSelect
    ///
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let strData = viewModel.orientationList[indexPath.item].id

        if #available(iOS 16.0, *) {
            if viewModel.selectedIndex.contains(indexPath.item) {
                //
                if let currIndex =  viewModel.selectedIndex.firstIndex(of: indexPath.item) {// if it contains the index then delete from array
                    viewModel.selectedIndex.remove(at: currIndex)
                    viewModel.selectedInterests.remove(at: currIndex)
                           }                
            }
            else {
                if viewModel.selectedIndex.count < 3{
                    viewModel.selectedIndex.append(indexPath.item)
                    viewModel.selectedInterests.append(strData)
                }else{
                    self.alert(message: "You can select upto three orientations")
                }
                
            }
        } else {
            // Fallback on earlier versions
        }
        orientationTable.reloadData()
    }

    }
