//
//  HomeVC.swift
//  Codex-Task
//
//  Created by Mohamad Basuony on 02/11/2023.
//

import UIKit
import Combine

class HomeVC: UIViewController {
    
    @IBOutlet weak var adsView: UIView!
    @IBOutlet weak var peopleCV: UICollectionView!
    lazy var homeCollectionView = HomeCollectionView()
    @IBOutlet weak var categoriesCV: UICollectionView!
    @IBOutlet weak var imagesCV: UICollectionView!
    @IBOutlet weak var imagesCVHeightConstraints: NSLayoutConstraint!
    // Create Configurator for dependency injection
    var presenter : HomePresenter?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterInit()
        presenter?.getPersons()
        presenter?.getCategories()
        registerCells()
        setDelegates()
        // Do any additional setup after loading the view.
    }
    
    private func presenterInit(){
        HomeConfiguratorImplementation().configure(view: self)
    }

    private func registerCells(){
        peopleCV.registerClassFor(cellClass: PersonCell.self)
        categoriesCV.registerClassFor(cellClass: CategoryHeaderCell.self)
        imagesCV.registerClassFor(cellClass: CategoryImageCell.self)
     }
    
    private func setDelegates(){
        peopleCV.delegate = self
        peopleCV.dataSource = self
        categoriesCV.delegate = self
        categoriesCV.dataSource = self
        imagesCV.delegate = self
        imagesCV.dataSource = self
    }
    
    func setNavBarItems(){
        let notificationBtn = BadgedButtonItem(with: UIImage(named: "notification")?.withRenderingMode(.alwaysOriginal))
        notificationBtn.setBadge(with: 2)
        let searchBtn = UIBarButtonItem(image: UIImage(named: "search-normal")?.withRenderingMode(.alwaysOriginal),  style: .done, target: self, action: nil)
        setNavBarRightItems(item: [notificationBtn])
        setNavBarLeftItems(item: [searchBtn])
    }

    private func configureCollectionView(){
        adsView.addSubview(homeCollectionView)
        homeCollectionView.edgesToSuperview()
        homeCollectionView.sectionDelegate = self
        homeCollectionView.performUpdates()
        homeCollectionView.backgroundColor = .clear
    }

    @IBAction func newAdBtn(_ sender: Any) {
        presenter?.pushToNewAdd()
    }
}

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == peopleCV {
            return presenter?.persons?.count ?? 0
        }else if collectionView == categoriesCV {
            return presenter?.categories?.count ?? 0
        }else {
            return presenter?.images?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == peopleCV {
            let cell = collectionView.dequeueReusableCell(cellClass: PersonCell.self, for: indexPath)
            cell.configureCell(model: presenter?.persons?[indexPath.item] ?? PersonModel())
            return cell
        }else if collectionView == categoriesCV {
            let cell = collectionView.dequeueReusableCell(cellClass: CategoryHeaderCell.self, for: indexPath)
            cell.configureCell(categoryTitle: presenter?.categories?[indexPath.item].name ?? "")
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(cellClass: CategoryImageCell.self, for: indexPath)
            cell.configureCell(imageName: presenter?.images?[indexPath.item] ?? "")
            cell.backgroundView?.backgroundColor = .white
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCV {
            presenter?.selectCategory(index: indexPath.item)
        }
    }
}

//extension HomeVC : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == peopleCV {
//            return CGSize(width: 130, height: 170)
//        }else if collectionView == categoriesCV {
//            return CGSize(width: 100, height: 40)
//        } else {
//            return CGSize(width: presenter?.imageWidth ?? 200, height: 455)
//        }
//    }
//}


extension HomeVC: CollectionViewDataDelegate {
    func data() -> [AnyHashable] {
        return presenter?.sectionData ?? []
    }
}

extension HomeVC : HomeDelegate {
    func didSelectCategory() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: presenter?.imageWidth ?? 200, height: 360)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        imagesCV.collectionViewLayout = layout
        imagesCVHeightConstraints.constant = presenter?.imageCVHeight ?? 0
        imagesCV.reloadData()
    }
    
    func getHomeDataDidSuccess() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.categoriesCV.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        }
        configureCollectionView()
    }
    
    func requestDidFail(_ message: String) {
        // Show Alert or any action
    }
}
