//
//  RequestVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 24/02/23.
//

import Foundation
import UIKit

extension RequestVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestTableCell", for: indexPath) as! RequestTableCell
        return cell
    }
    
    
}
