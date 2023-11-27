//
//  CategoryCell.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    lazy var collectionView = CategoriesCollectionView()
    
    var sectionList: [Section] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("GrandCell coder has not been implemented")
    }
    
    func setupView(){
        addSubview(collectionView)
        collectionView.isScrollEnabled = true
        collectionView.edgesToSuperviewBoundsWithAutoResizingMask()
        collectionView.sectionDelegate = self
        collectionView.backgroundColor = .clear
    }
    
    func configure(with item: Section) {
        sectionList = [item]
        collectionView.performUpdates()
    }
    
    
    
}

extension CategoryCell: CollectionViewDataDelegate {
    func data() -> [AnyHashable] {
        return sectionList
    }
}
