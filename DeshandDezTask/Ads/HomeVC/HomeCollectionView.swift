//
//  HomeCollectionView.swift
//  Codex-Task
//
//  Created by Mohamad Basuony on 03/11/2023.
//

import UIKit
import Combine

typealias HomeSectionSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
typealias HomeDataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>

protocol PagerDelegate: AnyObject {
    func didValueChanged(indexPath: IndexPath, scrollPosition: UICollectionView.ScrollPosition)
}

protocol MenuTabProtocol: AnyObject {
    func updateLayout()
    func scrollGrandCell(for indexPath: IndexPath)
}

protocol CollectionViewDataDelegate: AnyObject {
    func data() -> [AnyHashable]
}

class HomeCollectionView: UICollectionView {

    weak var sectionDelegate: CollectionViewDataDelegate!
    
    var datasource: HomeDataSource!
    
    var titleHeaderRegistration: UICollectionView.SupplementaryRegistration<TitleHeaderView>!

    var pagingFooterRegistration: UICollectionView.SupplementaryRegistration<PagerFooterView>!

    var tabHeaderRegistration: UICollectionView.SupplementaryRegistration<TabHeaderView>!

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
        configureSupplementaryViews()
    }
    
    func configureDataSource(){
        
        let personCellRegistration = UICollectionView.CellRegistration<PersonCell, PersonModel> { (cell, indexPath, item) in
            cell.configureCell(model:item)
        }
        
        let categoryCellRegistration = UICollectionView.CellRegistration<CategoryCell, Section> { (cell, indexPath, item) in
            cell.configure(with: item)
            cell.sizeToFit()
        }
        
        datasource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: self) { [unowned self]
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            let section = self.sectionList[indexPath.section]
            switch section.cellType {
                
            case is PersonCell.Type:
                guard let data = section.data as? [PersonModel] else {return nil}
                return collectionView.dequeueConfiguredReusableCell(using: personCellRegistration, for: indexPath, item: data[indexPath.row])
                
            case is CategoryCell.Type:
                guard let data = section.data as? [Section] else {return nil}
                return collectionView.dequeueConfiguredReusableCell(using: categoryCellRegistration, for: indexPath, item: data[indexPath.row])
            
            default : return nil
            }
        }
    }
    
    private func configureSupplementaryViews(){
        
        titleHeaderRegistration = .init(elementKind: UICollectionView.elementKindSectionHeader, handler: { [unowned self] header, elementKind, indexPath in
            let section = getSection(for: indexPath.section)
            header.configure(with: section.title, leftSpace : section.headerLeftSpace, topSpace: section.headerTopSpace , bottomSpace : section.headerBottomSpace)
        })
        
        pagingFooterRegistration = .init(elementKind: UICollectionView.elementKindSectionFooter) { [unowned self]
            (footer, elementKind, indexPath) in

            footer.subscribeTo(subject: getSection(for: indexPath.section).pageListener, for: indexPath.section)
            footer.configure(numberOfPages: sectionList[indexPath.section].data.count, indexPath: indexPath, delegate: self)
        }
        
        tabHeaderRegistration = .init(elementKind: UICollectionView.elementKindSectionHeader, handler: { [unowned self] header, elementKind, indexPath in
            let section = getSection(for: indexPath.section)
            guard let data = section.data as? [Section] else {return}
            header.subscribeTo(subject: section.pageListener , for: indexPath.section)
            header.configure(menuData: data.map{Menu(title: $0.title)}, indexPath: indexPath, delegate: self)
        })
        
        datasource.supplementaryViewProvider = supplementaryView
        
    }
    
    
    private func supplementaryView(in collection: UICollectionView, elementKind: String, at indexPath: IndexPath) -> UICollectionReusableView? {
        if elementKind == UICollectionView.elementKindSectionHeader {
            switch sectionList[indexPath.section].headerType {
            case is TabHeaderView.Type:
                return self.dequeueConfiguredReusableSupplementary(using: tabHeaderRegistration, for: indexPath)
            default:
                return self.dequeueConfiguredReusableSupplementary(using: titleHeaderRegistration, for: indexPath)
            }
        } else  {
                return self.dequeueConfiguredReusableSupplementary(using: pagingFooterRegistration, for: indexPath)
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
        var snapshot = HomeSectionSnapshot()
        sectionList.forEach({
            snapshot.appendSections([$0])
            snapshot.appendItems($0.data)
        })
        datasource.apply(snapshot,animatingDifferences: true)
    }
    
}

extension HomeCollectionView: PagerDelegate {
    func didValueChanged(indexPath: IndexPath, scrollPosition: UICollectionView.ScrollPosition) {
        self.scrollToItem(at: indexPath, at: scrollPosition, animated: true)
    }
}

extension HomeCollectionView: MenuTabProtocol {
    
    func updateLayout() {
        collectionViewLayout.invalidateLayout()
    }
    
    func scrollGrandCell(for indexPath: IndexPath) {
        scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}
