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
        searchCollection.reloadData()
    }
   //MARK: - private functions
    private lazy var viewModel: SearchVM = {
        return SearchVM()
    }()


}

extension SearchVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
        cell.cellImage.image = viewModel.dataArray[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: searchCollection.frame.width/2.1, height: searchCollection.frame.height/4)
    }

}
