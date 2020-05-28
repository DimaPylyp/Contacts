//
//  ContactsLayoutListCollectionViewCell.swift
//  Contacts by Dima
//
//  Created by DiMa on 28/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ContactsLayoutListCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "ContactsLayoutListCollectionViewCell"
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.frame.size = CGSize(width: 40, height: 40)
        return imageView
    }()
    
    let statusIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(with user: User){
        avatarImageView.image = user.avatar
        nameLabel.text = user.name
        switch user.status {
        case .online:
            print("\(user.name) is online")
        case .offline:
            print("\(user.name) is offline")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(avatarImageView)
        avatarImageView.addSubview(statusIndicator)
        addSubview(nameLabel)
        
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        statusIndicator.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor).isActive = true
        statusIndicator.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

