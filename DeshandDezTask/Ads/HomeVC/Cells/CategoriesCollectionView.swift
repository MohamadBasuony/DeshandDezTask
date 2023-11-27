//
//  CategoriesCollectionView.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import Foundation
import UIKit
import Combine

typealias CategoriesSectionSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
typealias CategoriesDataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>

class CategoriesCollectionView: UICollectionView {

    weak var sectionDelegate: CollectionViewDataDelegate!
    
    var datasource: CategoriesDataSource!
    
        
    var sectionList: [Section] {
        return sectionDelegate?.data() as? [Section] ?? []
    }
    
    override init(frame: CGRect = .zero, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        setCollectionViewLayout(UICollectionViewCompositionalLayout(sectionProvider: layout), animated: false)
        backgroundColor = .white
        configureDataSource()
//        configureSupplementaryViews()
    }
    
    func configureDataSource(){
        
        let personCellRegistration = UICollectionView.CellRegistration<CategoryImageCell, String> { (cell, indexPath, item) in
            cell.configureCell(imageName: item)
        }
        
        datasource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: self) { [unowned self]
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            let section = self.sectionList[indexPath.section]
            switch section.cellType {
                
            case is CategoryImageCell.Type:
                guard let data = section.data as? [String] else {return nil}
                return collectionView.dequeueConfiguredReusableCell(using: personCellRegistration, for: indexPath, item: data[indexPath.row])
                
            default : return nil
            }
        }
    }
    
    private func getSection(for sectionIndex: Int) -> Section {
        return datasource.snapshot().sectionIdentifiers[sectionIndex]
    }
    
    // MARK: Layout
    private func layout(for sectionIndex: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        let section = getSection(for: sectionIndex)
        return section.layout(sectionIndex ,environment, section.data.count, section.pageListener, collectionViewLayout)
    }
    
    // MARK: PerformUpdates
    func performUpdates(){
        var snapshot = CategoriesSectionSnapshot()
        sectionList.forEach({
            snapshot.appendSections([$0])
            snapshot.appendItems($0.data)
        })
        datasource.apply(snapshot,animatingDifferences: true)
    }
    
}

extension CategoriesCollectionView: PagerDelegate {
    func didValueChanged(indexPath: IndexPath, scrollPosition: UICollectionView.ScrollPosition) {
        self.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
    }
}

extension CategoriesCollectionView: MenuTabProtocol {
    
    func updateLayout() {
        collectionViewLayout.invalidateLayout()
    }
    
    func scrollGrandCell(for indexPath: IndexPath) {
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}
