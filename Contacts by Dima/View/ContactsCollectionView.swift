//
//  ContactsCollectionView.swift
//  Contacts by Dima
//
//  Created by DiMa on 28/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ContactsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    private let users = User.defaultUsers
    
    func configureCollectionViewLayoutItemSize() {
        layout.itemSize = CGSize(width: collectionViewLayout.collectionView!.frame.size.width, height: 50)
    }
    
    init() {
        
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = UIColor.systemBackground
        delegate = self
        dataSource = self
        register(ContactsLayoutListCollectionViewCell.self, forCellWithReuseIdentifier: ContactsLayoutListCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 0
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ContactsLayoutListCollectionViewCell.reuseId, for: indexPath) as! ContactsLayoutListCollectionViewCell
        cell.setup(with: users[indexPath.row])
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

