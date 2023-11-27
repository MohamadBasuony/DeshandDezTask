//
//  NS.swift
//  Codex-Task
//
//  Created by Mohamad Basuony on 03/11/2023.
//

import Foundation
import UIKit

extension NSCollectionLayoutSection {
    static func peopleSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(130), heightDimension: .estimated(80))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 12, leading: 15, bottom: 12, trailing: 15)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    static func categoryHeaderSection() -> NSCollectionLayoutSection {
        
        let size = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .estimated(40))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20 )
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    static func categorySection() -> NSCollectionLayoutSection {
        let estimatedHeight = CGFloat(500)

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(estimatedHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.9))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20 )

        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    static func sliderSection(leading : CGFloat , trailing : CGFloat, top : CGFloat, bottom : CGFloat, height : CGFloat) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets.leading = leading
        group.contentInsets.trailing = trailing
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = top
        section.contentInsets.bottom = bottom
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section
    }
    
    static func verticalWaterfallSection(config: WaterfallConfiguration) -> NSCollectionLayoutSection {
        var items = [NSCollectionLayoutGroupCustomItem]()
        let builder = VerticalWaterfallBuilder(config: config)
        
        for i in 0..<config.dataCount {
            let item = builder.prepareItem(for: i)
            items.append(item)
        }
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(builder.maxHeight))
        
        let group = NSCollectionLayoutGroup.custom(layoutSize: groupSize) { _ in
            return items
        }

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 8, leading: 20, bottom: 8, trailing: 20)
        
        return section
    }
    
    static func menuSection() -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .estimated(40))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8 )
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}

extension NSCollectionLayoutSection {
    func addHeader(pinToVisibleBounds: Bool = true) {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(30))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.pinToVisibleBounds = false
            header.zIndex = Int.max
        boundarySupplementaryItems += [header]
    }
    
    func addPagerFooter(pinToVisibleBounds: Bool = false) {
        contentInsets.bottom = -35
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        footer.zIndex = 20
        footer.pinToVisibleBounds = pinToVisibleBounds
        boundarySupplementaryItems += [footer]
    }
}

extension NSCollectionLayoutSection {
    func addVisibleItemsHandler(with listener: PageListener?, sectionIndex: Int){
        visibleItemsInvalidationHandler = { (items, offset, env) -> Void in
            let page = round(offset.x / env.container.contentSize.width)
            listener?.send(Page(pageIndex: Int(page), sectionIndex: sectionIndex))
        }
    }
}
