//
//  ContactsLayoutGridCollectionViewCell.swift
//  Contacts by Dima
//
//  Created by DiMa on 29/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ContactsLayoutGridCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "ContactsLayoutGridCollectionViewCell"
    
    let avatarImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.frame.size = CGSize(width: 40, height: 40)
        return imageView
    }()
    
    let statusIndicator: UIView = {
        let backgroundView = UIView()
        backgroundView.frame.size = CGSize(width: 15, height: 15)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 7.5
        backgroundView.clipsToBounds = true
        backgroundView.layer.borderColor = UIColor.white.cgColor
        backgroundView.layer.borderWidth = 1
        let view = UIView()
        view.frame.size = CGSize(width: 15, height: 15)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2.5
        view.clipsToBounds = true
        view.layer.borderColor = UIColor(red: 0.20392156862745098, green: 0.7803921568627451, blue: 0.34901960784313724, alpha: 1.0).cgColor
        view.layer.borderWidth = 7.5
        backgroundView.addSubview(view)
        return backgroundView
    }()
    
    func setup(with user: UserModel){
        avatarImageView.loadImagesUsingUrlString(urlString: user.avatarUrl)
        switch user.status {
        case .online:
            avatarImageView.addSubview(statusIndicator)
            
            statusIndicator.heightAnchor.constraint(equalToConstant: 15).isActive = true
            statusIndicator.widthAnchor.constraint(equalToConstant: 15).isActive = true
            statusIndicator.trailingAnchor.constraint(equalTo: avatarImageView.trailingAnchor).isActive = true
            statusIndicator.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
        case .offline:
            break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(avatarImageView)
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
