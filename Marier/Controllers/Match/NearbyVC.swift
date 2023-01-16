//
//  NearbyVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class NearbyVC: UIViewController {

    @IBOutlet weak var nearbyTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
   //MARK: - load data
    func loadData(){
        nearbyTable.register(UINib(nibName: "NearbyTableCell", bundle: nil), forCellReuseIdentifier: "NearbyTableCell")
    }

}

extension NearbyVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nearbyTable.dequeueReusableCell(withIdentifier: "NearbyTableCell") as! NearbyTableCell
        return cell
    }
    
    
}
