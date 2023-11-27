//
//  NewAddRouter.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import Foundation
protocol NewAddRouter {
    func pop()
}

class NewAddRouterImplementation: NewAddRouter {

    fileprivate weak var view: NewAdVC?
    
    init(view: NewAdVC) {
        self.view = view
    }

    func pop(){
        view?.navigationController?.popViewController(animated: true)
    }
}
