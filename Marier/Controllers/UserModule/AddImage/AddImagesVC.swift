//
//  AddInterestsVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit


class AddImagesVC: BaseClass {

    @IBOutlet weak var picCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: - private function/////
    private lazy var viewModel: AddImageVM = {
        return AddImageVM()
    }()
    //MARK: - actions////////////
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func onContinueTap(_ sender: UIButton){
        let vc = storyBoards.TabBar.instantiateViewController(withIdentifier: "BottomBar") as! BottomBar
        self.pushVC(controller: vc)
    }

}

extension AddImagesVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = picCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PicCollectionCell
        cell.plusBtn.isHidden = true
        cell.cellImage.image = viewModel.arrayData[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: picCollection.frame.width/2.1, height: picCollection.frame.height/2.1)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        openCameraAndPhotos(isEditImage: true) { [self] image, message in
            print(message)
           viewModel.arrayData.removeAll()
            for i in 0...3{
                print(i)
                viewModel.arrayData.append(image)
            }
            picCollection.reloadData()
        } failure: { error in
            print(error)
        }

    }
    
    
}
