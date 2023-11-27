//
//  TabHeaderView.swift
//  Codex-Task
//
//  Created by Mohamad Basuony on 03/11/2023.
//

import Foundation
import UIKit

class TitleHeaderView: UICollectionReusableView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 18)
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
    
    func setUp(){
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("HeaderView init(coder:) has not been implemented")
    }
    
    func configure(with item: String ,leftSpace : CGFloat , topSpace : CGFloat , bottomSpace : CGFloat ) {
        titleLabel.text = item
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: leftSpace).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: topSpace).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: topSpace).isActive = true
    }
        
}
