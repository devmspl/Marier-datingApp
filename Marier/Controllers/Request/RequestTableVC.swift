//
//  RequestTableVC.swift
//  Marier
//
//  Created by MacBook M1 on 24/02/23.
//

import UIKit

class RequestTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        super.loadView()
        tableView.register(UINib(nibName: "RequestTableCell", bundle: nil), forCellReuseIdentifier: "RequestTableCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestTableCell", for: indexPath) as! RequestTableCell

        return cell
    }
}
