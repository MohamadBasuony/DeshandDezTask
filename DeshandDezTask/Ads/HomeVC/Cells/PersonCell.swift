//
//  PersonCell.swift
//  DeshandDezTask
//
//  Created by Mohamad Basuony on 26/11/2023.
//

import Foundation
import UIKit

class PersonCell : UICollectionViewCell {
    
    lazy var personImage: UIImageView = {
        let image = UIImageView()
        image.widthAnchor.constraint(equalToConstant: 52).isActive = true
        image.heightAnchor.constraint(equalToConstant: 52).isActive = true
        image.layer.cornerRadius = 26
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 14)
        return label
    }()
    
    lazy var jobLabel: UILabel = {
        let label = UILabel()
        label.textColor = .main
        label.font = UIFont(name: "Poppins-Regular", size: 10)
        return label
    }()
    
    lazy var followBtn : UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 8)
        btn.borderColor = .main
        btn.borderWidth = 1
        btn.layer.cornerRadius = 15
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return btn
    }()
    
    lazy var personDataStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel , jobLabel ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = -2
        return stackView
    }()
    
    
    lazy var personVStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [personImage , personDataStack , followBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 5
        followBtn.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 30).isActive = true
        followBtn.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -30).isActive = true
        return stackView
    }()
    
    lazy var mainVStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [favoriteStack,personVStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = -16
        return stackView
    }()
    
    lazy var mainHStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainVStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        mainVStack.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 5).isActive = true
        mainVStack.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20).isActive = true
        stackView.borderColor = .main
        stackView.borderWidth = 1
        stackView.layer.cornerRadius = 16
        stackView.backgroundColor = .personCellBackground
        return stackView
    }()
    
    lazy var favoriteStack : UIStackView = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "favoriteImg"), for: .normal)
        btn.widthAnchor.constraint(equalToConstant: 32).isActive = true
        let stack = UIStackView(arrangedSubviews: [btn])
        stack.distribution = .equalSpacing
        stack.alignment = .center
        btn.leftAnchor.constraint(equalTo: stack.leftAnchor, constant: -80).isActive = true
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        addSubview(mainHStack)
        NSLayoutConstraint.activate([
            mainHStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainHStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            mainHStack.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            mainHStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
    func configureCell(model : PersonModel){
        personImage.image = UIImage(named: model.image ?? "")
        nameLabel.text = model.name ?? ""
        jobLabel.text = model.job ?? ""
        followBtn.setTitle(model.followBtnConfig.0 , for: .normal)
        followBtn.setTitleColor(model.followBtnConfig.1, for: .normal)
        followBtn.backgroundColor = model.followBtnConfig.2
    }
    
}
