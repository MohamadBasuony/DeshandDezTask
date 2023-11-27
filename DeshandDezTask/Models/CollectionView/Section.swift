//
//  Section.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import Foundation
import UIKit

typealias SectionLayout = (Int, NSCollectionLayoutEnvironment, Int, PageListener?, UICollectionViewLayout) -> NSCollectionLayoutSection

class Section: Hashable {
    
    let uuid = UUID()
    let title: String
    let headerLeftSpace : CGFloat
    let headerTopSpace : CGFloat
    let headerBottomSpace : CGFloat
    let data: [AnyHashable]
    let cellType: UICollectionViewCell.Type
    let headerType: UICollectionReusableView.Type?
    let footerType: UICollectionReusableView.Type?
    let layout: SectionLayout
    
    lazy var pageListener = PageListener()
    
    init(
        title: String ,
        showArrow : Bool,
        showSeeAll : Bool,
        headerLeftSpace : CGFloat,
        headerTopSpace : CGFloat,
        headerBottomSpace : CGFloat,
        data: [AnyHashable],
        cellType: UICollectionViewCell.Type,
        headerType: UICollectionReusableView.Type? = nil,
        footerType: UICollectionReusableView.Type? = nil,
        layout: @escaping SectionLayout
    ) {
        self.title = title
        self.headerLeftSpace = headerLeftSpace
        self.headerTopSpace = headerTopSpace
        self.headerBottomSpace = headerBottomSpace
        self.data = data
        self.cellType = cellType
        self.headerType = headerType
        self.footerType = footerType
        self.layout = layout
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    public static func == (lhs: Section, rhs: Section) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
//
extension Section {
    convenience init (persons : [PersonModel]) {
        self.init(title: "Discover People ",showArrow: true ,showSeeAll: false, headerLeftSpace: 6, headerTopSpace: 5, headerBottomSpace: 10, data: persons, cellType: PersonCell.self, layout: { _,_,_,_,_   in
            let layout: NSCollectionLayoutSection = .peopleSection()
            layout.addHeader()
            return layout
        })
    }
}
//
extension Section {
    convenience init(sectionTitle: String , images : [String]){
        self.init(title: sectionTitle,showArrow: true ,showSeeAll: false, headerLeftSpace: 0, headerTopSpace: 10, headerBottomSpace: 10, data: images, cellType: CategoryImageCell.self, layout: { _,environment,dataCount,_,_   in
            let config = WaterfallConfiguration(dataCount: dataCount, columnCount: 2, itemSpacing: 16, sectionHorizontalSpacing: 12, itemHeightProvider: { 345 }, environment: environment)
            let layout: NSCollectionLayoutSection = .verticalWaterfallSection(config: config)
            return layout
        })
    }
}

extension Section {
    convenience init(categories : [Section]){
        self.init(title: "Categories",showArrow: true ,showSeeAll: false, headerLeftSpace: 0, headerTopSpace: 10, headerBottomSpace: 10, data: categories, cellType: CategoryCell.self, headerType: TabHeaderView.self, footerType: PagerFooterView.self, layout: { sectionIndex, _,_,pageListener,_  in
            let layout: NSCollectionLayoutSection = .categorySection()
            layout.addHeader()
            layout.addVisibleItemsHandler(with: pageListener, sectionIndex: sectionIndex)
            return layout
        })
    }
}
//
//extension Section {
//    convenience init(ads : [Ad]){
//        self.init(title: "",showArrow: false ,showSeeAll: false, headerTopSpace: 0, data: ads, cellType: SliderCell.self, layout: { sectionIndex, _,_,pageListener,_   in
//            let layout: NSCollectionLayoutSection = .sliderSection(leading : 20 , trailing: 20 , top : 12, bottom: 24 , height: 115)
//            return layout
//        })
//    }
//}
//
//extension Section {
//    convenience init(products : [Product] , header : String , headerTopSpace: CGFloat){
//        self.init(title: header,showArrow: false ,showSeeAll: true, headerTopSpace: headerTopSpace, data: products, cellType: ProductCell.self, layout: { _,environment,dataCount,_,_   in
//            let config = WaterfallConfiguration(dataCount: dataCount, columnCount: 2, itemSpacing: 18, sectionHorizontalSpacing: 16, itemHeightProvider: { 210 }, environment: environment)
//            let layout: NSCollectionLayoutSection = .verticalWaterfallSection(config: config)
//            layout.addHeader()
//            return layout
//        })
//    }
//}

