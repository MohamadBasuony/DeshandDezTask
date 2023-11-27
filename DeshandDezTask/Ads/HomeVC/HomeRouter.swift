//
//  HomeRouter.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import Foundation
protocol HomeRouter {
    func pushToNewAddVC()
    func dismiss()
}

class HomeRouterImplementation: HomeRouter {

    fileprivate weak var view: HomeVC?
    
    init(view: HomeVC) {
        self.view = view
    }
    
    func pushToNewAddVC(){
        let vc = StoryBoards.Main.instance.instantiateViewController(withIdentifier: "NewAdVC") as? NewAdVC
        // For any injection or configuration
        NewAddConfiguratorImplementation().configure(view: vc ?? NewAdVC())
        view?.navigationController?.pushViewController(vc ?? NewAdVC(), animated: true)
    }
    
    func dismiss(){
        view?.dismiss(animated: true)
    }
}
