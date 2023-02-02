//
//  SearchVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class SearchVC: UIViewController {

    
    @IBOutlet weak var searchCollection: UICollectionView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
//MARK: - private functions
    private lazy var viewModel: SearchVM = {
        return SearchVM()
    }()
    
    func getData(){
        viewModel.getLikeUsers { [self] isSuccess, error in
            if isSuccess{
                searchCollection.reloadData()
            }else{
                alert(message: error)
            }
        }
    }

}

extension SearchVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.likeUsers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
        cell.config(cellData:viewModel.likeUsers[indexPath.item].likeBy)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchCollection.frame.width/2, height: searchCollection.frame.height/3)
    }

}
