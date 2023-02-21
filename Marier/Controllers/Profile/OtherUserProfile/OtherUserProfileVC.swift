//
//  OtherUserProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 25/01/23.
//

import UIKit
import PageControls
import SocketIO

class OtherUserProfileVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var pageControlV: UIPageControl!
    @IBOutlet weak var pageControlview: UIView!
    @IBOutlet weak var detailView :UIView!
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var interestCollection :UICollectionView!
    @IBOutlet weak var orientationCollection: UICollectionView!
    @IBOutlet weak var galleryCollection :UICollectionView!
    
    var id = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiCall()
        pageControlV.hidesForSinglePage = true
//        pageControlview.
        
    }
    
    //MARK: - Private functions
    internal lazy var viewModel: OtherUserVM = {
        return OtherUserVM()
    }()
    //////////////
    private func ApiCall(){
        viewModel.getUserData(id: self.id) { [self] isSuccess, error in
            if isSuccess{
                loadData()
                imageCollection.reloadData()
                interestCollection.reloadData()
                orientationCollection.reloadData()
                galleryCollection.reloadData()
                pageControlV.numberOfPages = viewModel.userData?.gallery.count ?? 0
            }else{
                alert(message: error)
            }
        }
    }
    ////////////
    func loadData(){
        name.text = (viewModel.userData?.name ?? "")+", \(calculateAge(birthday: viewModel.userData?.dob ?? ""))"
        address.text = viewModel.userData?.sex
//        imageCollection.register(UINib(nibName: "ImagesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionCell")
        interestCollection.register(UINib(nibName: "ChipCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ChipCollectionCell")
        orientationCollection.register(UINib(nibName: "ChipCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ChipCollectionCell")
        galleryCollection.register(UINib(nibName: "ImagesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionCell")
    }
//MARK: - ACTIONS
    
    @IBAction func backTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func dislikeTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func superLikeTapped(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func likeTapped(_ sender: UIButton){
        self.poptoViewController()
    }

    @IBAction func messageTapped(_ sender: UIButton){
        let vc = storyBoards.Chat.instantiateViewController(withIdentifier: "ChatInboxVC") as! ChatInboxVC
        vc.name = viewModel.userData?.name ?? ""
        vc.otherUserId = viewModel.userData?.id ?? ""
        socket.emit("join-user", getUserId())
        if viewModel.userData?.avatar == ""{
            vc.avatar = (viewModel.userData?.gallery[0]!.image)!
        }else{
            vc.avatar = viewModel.userData!.avatar
        }
        self.pushVC(controller: vc)
    }
}
