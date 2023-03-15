//
//  PrivacyVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 27/02/23.
//

import Foundation
import UIKit

extension PrivacyVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.privacyTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrivacyCell", for: indexPath) as! PrivacyCell
        cell.privacyType.text = viewModel.privacyTypeArray[indexPath.row]
        cell.settingtext.text = viewModel.settingArray[indexPath.row]
        return cell
    }
    
    
}
