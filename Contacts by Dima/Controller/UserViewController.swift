//
//  UserViewController.swift
//  Contacts by Dima
//
//  Created by DiMa on 31/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    var user: UserModel? {
        didSet{
            if let url = user?.bigAvatarUrl {
            avatarImageView.loadImagesUsingUrlString(urlString: url)
            }
            
            if let name = user?.name {
                nameLabel.text = name
            }
            
            if let email = user?.email {
                emailLabel.text = email
            }
            
            if let status = user?.status {
                switch status {
                case .online:
                    statusLabel.text = "online"
                case .offline:
                    statusLabel.text = "offline"
                }
            }
        }
    }
    
    let avatarImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame.size = CGSize(width: 200, height: 200)
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 5
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var backButton: UIButton = {
           let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.frame.size = CGSize(width: 20, height: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
           button.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
           return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(backButton)
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(emailLabel)

        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -20).isActive = true
        
        statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        statusLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 20).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
