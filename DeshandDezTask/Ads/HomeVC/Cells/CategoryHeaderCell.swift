//
//  CategoryCell.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 27/11/2023.
//

import UIKit

class CategoryHeaderCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .main : .white
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 10)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
    func configureCell( categoryTitle: String ) {
        titleLabel.text = categoryTitle
    }
}
