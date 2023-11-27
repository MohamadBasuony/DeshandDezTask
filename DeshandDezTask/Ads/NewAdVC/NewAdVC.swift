//
//  NewAdVC.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import UIKit

class NewAdVC: UIViewController {

    var presenter : NewAddPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func popBtn(_ sender: Any) {
        presenter?.pop()
    }
    
}
