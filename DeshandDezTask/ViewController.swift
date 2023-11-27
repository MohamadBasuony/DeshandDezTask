//
//  ViewController.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import UIKit

class ViewController: BaseVC {

    @IBOutlet weak var adsView: UIView!
    lazy var homeCollectionView = HomeCollectionView()

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

