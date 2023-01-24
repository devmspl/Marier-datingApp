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
    //MARK: - private functions
    private lazy var viewModel: NearbyVM = {
        return NearbyVM()
    }()
    
    override func viewDidAppear(_ animated: Bool) {
      
//        viewModel.getNearbyUsers { [self] isSuccess, error in
//            if isSuccess{
//                nearbyTable.reloadData()
//            }else{
//                alert(message: error)
//            }
//        }
    }
   //MARK: - load data
    func loadData(){
        nearbyTable.delegate = self
        nearbyTable.dataSource = self
        nearbyTable.register(UINib(nibName: "NearbyTableCell", bundle: nil), forCellReuseIdentifier: "NearbyTableCell")
    }

}

extension NearbyVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nearbyTable.dequeueReusableCell(withIdentifier: "NearbyTableCell") as! NearbyTableCell
//        cell.cellConfig(data:viewModel.nearbyUsers[indexPath.row])
        return cell
    }
    
    
}
