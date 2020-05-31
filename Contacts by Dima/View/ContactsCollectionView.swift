//
//  ContactsCollectionView.swift
//  Contacts by Dima
//
//  Created by DiMa on 28/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ContactsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var users = [UserModel]()

    var layout: UICollectionViewFlowLayout = SeparatorCollectionViewFlowLayout()
    
    var layoutOption: LayoutOption = .list
    
    func setupLayout(with containerSize: CGSize) {
        
        
        
        switch self.layoutOption {
        case .list:
            guard let flowLayout = self.collectionViewLayout as? SeparatorCollectionViewFlowLayout else {
                return
            }
            flowLayout.minimumLineSpacing = 1
            flowLayout.itemSize = CGSize(width: containerSize.width, height: 50)
            
        case .grid:
            guard let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout else {
                return
            }
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            flowLayout.itemSize = CGSize(width: 50, height: 50)
            flowLayout.sectionInset = .zero

        }
        
        self.reloadData()
    }
    
    func appendUsers(with user: UserModel){
        users.append(user)
        reloadData()
    }
    
    func changeModel(){
        for user in users{
            let userWillBeRemoved = Bool.random()
            if userWillBeRemoved{
                guard let index = users.firstIndex(of: user) else { return }
                users.remove(at: index)
            }
        }
        for index in users.indices{
            users[index].status = Status.allCases.randomElement()!
        }
        reloadData()
    }
    
    func configureCollectionViewLayoutItemSize() {
        switch layoutOption {
        case .list:
            layout.itemSize = CGSize(width: collectionViewLayout.collectionView!.frame.size.width, height: 50)
            
        case .grid:
            layout.itemSize = CGSize(width: 50, height: 50)
        }
    }
    
    init() {
        
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = UIColor.systemBackground
        delegate = self
        dataSource = self
        register(ContactsLayoutListCollectionViewCell.self, forCellWithReuseIdentifier: ContactsLayoutListCollectionViewCell.reuseId)
        register(ContactsLayoutGridCollectionViewCell.self, forCellWithReuseIdentifier: ContactsLayoutGridCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 1
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch layoutOption {
        case .list:
            let cell = dequeueReusableCell(withReuseIdentifier: ContactsLayoutListCollectionViewCell.reuseId, for: indexPath) as! ContactsLayoutListCollectionViewCell
            cell.user = users[indexPath.row]
            return cell
        case .grid:
            let cell = dequeueReusableCell(withReuseIdentifier: ContactsLayoutGridCollectionViewCell.reuseId, for: indexPath) as! ContactsLayoutGridCollectionViewCell
            cell.setup(with: users[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let loginResponse = ["userInfo": users[indexPath.row]]
        NotificationCenter.default.post(name:NSNotification.Name("user selected"), object: nil, userInfo: loginResponse as [AnyHashable : Any])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

