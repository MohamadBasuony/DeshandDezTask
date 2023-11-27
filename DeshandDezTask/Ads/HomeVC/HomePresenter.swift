//
//  HomeViewModel.swift
//  Codex-Task
//
//  Created by Mohamad Basuony on 02/11/2023.
//

import Foundation
import UIKit

protocol HomeDelegate: AnyObject {
    func getHomeDataDidSuccess()
    func didSelectCategory()
    func requestDidFail(_ message : String)
}

protocol HomePresenter : AnyObject {
    var sectionData : [Section]? {get}
    var persons : [PersonModel]? {get}
    var categories : [CategoryModel]? {get}
    var images : [String]? {get}
    var imageWidth : CGFloat? {get}
    var imageCVHeight : CGFloat? {get}
    func getPersons()
    func getCategories()
    func selectCategory(index : Int)
    
    func pushToNewAdd()
}

class HomePresenterImplementation : HomePresenter {
    
    var sectionData : [Section]?
    var persons : [PersonModel]?
    var categories : [CategoryModel]?
    var images : [String]?
    var imageWidth : CGFloat?
    var imageCVHeight : CGFloat?
    
    var service : ApiAdsService
    private var delegate : HomeDelegate?
    private var router : HomeRouter?
    
    init(service : ApiAdsService,
         delegate : HomeDelegate,
         router : HomeRouter) {
        self.service = service
        self.delegate = delegate
        self.router = router
        sectionData = []
        getImageWidth()
    }
    
    func getPersons(){
       persons = service.getPersons()
    }
    
    func getCategories(){
        categories = service.getCategories()
        selectCategory(index: 0)
        delegate?.getHomeDataDidSuccess()

    }
    
    func selectCategory(index : Int){
        images = categories?[index].data ?? []
        getImageCVHeight()
        delegate?.didSelectCategory()
    }
    
    func getImageWidth(){
        imageWidth = ((UIScreen.main.bounds.size.width - 57) / 2 )
    }
    
    func getImageCVHeight(){
        imageCVHeight = CGFloat(((images?.count ?? 0) / 2 ) * 370)
    }
    
    func setupSections(){
        sectionData?.append(Section(persons: persons ?? []))
        let categorySections : [Section] = categories?.compactMap{Section(sectionTitle: $0.name ?? "", images: $0.data ?? [])} ?? []
        sectionData?.append(Section(categories: categorySections))
        self.delegate?.getHomeDataDidSuccess()
    }
    
    func pushToNewAdd() {
        router?.pushToNewAddVC()
    }
}
