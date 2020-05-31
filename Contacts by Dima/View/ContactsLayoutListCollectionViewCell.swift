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
    
    var user: UserModel? {
        didSet{
            if let url = user?.avatarUrl {
                avatarImageView.loadImagesUsingUrlString(urlString: url)
            }
            
            if let name = user?.name {
                nameLabel.text = name
            }
            if let status = user?.status {
                switch status {
                case .online:
                    statusIndicator.layer.borderColor = UIColor.white.cgColor
                    statusIndicator.layer.borderWidth = 1
                    let view = UIView()
                    view.frame.size = CGSize(width: 15, height: 15)
                    view.translatesAutoresizingMaskIntoConstraints = false
                    view.layer.cornerRadius = 2.5
                    view.clipsToBounds = true
                    view.layer.borderColor = UIColor(red: 0.20392156862745098, green: 0.7803921568627451, blue: 0.34901960784313724, alpha: 1.0).cgColor
                    view.layer.borderWidth = 7.5
                    statusIndicator.addSubview(view)
                case .offline:
                    break
                }
            }
        }
    }
    
    let avatarImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame.size = CGSize(width: 40, height: 40)
        
        imageView.contentMode = .scaleAspectFit
        //        imageView.layer.borderWidth = 5
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let statusIndicator: UIView = {
        let backgroundView = UIView()
        backgroundView.frame.size = CGSize(width: 15, height: 15)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 7.5
        backgroundView.clipsToBounds = true
        //        backgroundView.layer.borderColor = UIColor.white.cgColor
//        backgroundView.layer.borderWidth = 1
//        let view = UIView()
//        view.frame.size = CGSize(width: 15, height: 15)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 2.5
//        view.clipsToBounds = true
//        view.layer.borderColor = UIColor(red: 0.20392156862745098, green: 0.7803921568627451, blue: 0.34901960784313724, alpha: 1.0).cgColor
//        view.layer.borderWidth = 7.5
//        backgroundView.addSubview(view)
        return backgroundView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //    func setup(with user: UserModel){
    //        avatarImageView.loadImagesUsingUrlString(urlString: user.avatarUrl)
    //        nameLabel.text = user.name
    //        switch user.status {
    //        case .online:
    //            statusIndicator.layer.borderColor = UIColor.white.cgColor
    //            statusIndicator.layer.borderWidth = 1
    //            let view = UIView()
    //            view.frame.size = CGSize(width: 15, height: 15)
    //            view.translatesAutoresizingMaskIntoConstraints = false
    //            view.layer.cornerRadius = 2.5
    //            view.clipsToBounds = true
    //            view.layer.borderColor = UIColor(red: 0.20392156862745098, green: 0.7803921568627451, blue: 0.34901960784313724, alpha: 1.0).cgColor
    //            view.layer.borderWidth = 7.5
    //            statusIndicator.addSubview(view)
    //        case .offline:
    //            break
    //        }
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(statusIndicator)
        
        
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        statusIndicator.heightAnchor.constraint(equalToConstant: 15).isActive = true
        statusIndicator.widthAnchor.constraint(equalToConstant: 15).isActive = true
        statusIndicator.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor).isActive = true
        statusIndicator.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

