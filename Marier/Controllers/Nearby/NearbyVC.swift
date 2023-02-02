//
//  NearbyVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit
import CoreLocation

class NearbyVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var nearbyTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    //MARK: - private functions
    private lazy var viewModel: NearbyVM = {
        return NearbyVM()
    }()
    

   //MARK: - load data
    func loadData(){
        nearbyTable.register(UINib(nibName: "NearbyTableCell", bundle: nil), forCellReuseIdentifier: "NearbyTableCell")
                viewModel.getNearbyUsers { [self] isSuccess, error in
                    if isSuccess{
                        nearbyTable.reloadData()
                    }else{
                        alert(message: error)
                    }
                }
        }
}

extension NearbyVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nearbyUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nearbyTable.dequeueReusableCell(withIdentifier: "NearbyTableCell") as! NearbyTableCell
        cell.cellConfig(data:viewModel.nearbyUsers[indexPath.row])
        cell.configure(data: viewModel.nearbyUsers[indexPath.row].location)
        return cell
    }
    
    
}
