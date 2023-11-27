//
//  NewAddPresenter.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import Foundation
import UIKit

protocol NewAddPresenter : AnyObject {
    func pop()
}

class NewAddPresenterImplementation : NewAddPresenter {
    
    private var router : NewAddRouter?
    
    init(router : NewAddRouter) {
        self.router = router
    }
    
    func pop() {
        router?.pop()
    }
}
