//
//  SexualOrientationVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class SexualOrientationVC: UIViewController {

    @IBOutlet weak var orientationTable: UITableView!
    @IBOutlet weak var checkBoxBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - Private Function//
    private lazy var viewModel: SexualOrientationVM = {
        return SexualOrientationVM()
    }()
    //MARK: - actions///
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func checkBoxTap(_ sender: UIButton){
        
    }
    @IBAction func onContinueTapped(_ sender: UIButton){
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "AddInterestVC") as! AddInterestVC
        self.pushVC(controller: vc)

    }
    
}

extension SexualOrientationVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orientationTable.dequeueReusableCell(withIdentifier: "cell") as! OreintationCell
        cell.orientationLabel.text = viewModel.dataArray[indexPath.row]
        return cell
    }
    
    
}
