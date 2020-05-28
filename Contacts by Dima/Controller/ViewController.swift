//
//  ViewController.swift
//  Contacts by Dima
//
//  Created by DiMa on 28/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let contactsCollectionView = ContactsCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(contactsCollectionView)
        
        contactsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contactsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contactsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contactsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contactsCollectionView.configureCollectionViewLayoutItemSize()
    }
}

