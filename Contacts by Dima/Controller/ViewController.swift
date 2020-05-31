//
//  ViewController.swift
//  Contacts by Dima
//
//  Created by DiMa on 28/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userManager = UserManager()
    var users = [UserModel]()
    
    private let notificationCenter = NotificationCenter.default
        
    private var contactsCollectionView = ContactsCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userManager.delegate = self
        
        notificationCenter.addObserver(self, selector: #selector(presentUserVC(_:)), name: NSNotification.Name ("user selected"), object: nil)
        
        for _ in 0...60{
        userManager.fetchUser()
        }
        
        let segmentItems = ["List", "Grid"]
        let control = UISegmentedControl(items: segmentItems)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(control)
        
        view.addSubview(contactsCollectionView)
        
        let simulateButton = UIButton()
        simulateButton.setTitle("Simulate Changes", for: .normal)
        simulateButton.setTitleColor(UIColor.init(red: 0.20392156862745098, green: 0.596078431372549, blue: 0.8588235294117647, alpha: 1.0), for: .normal)
        simulateButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        simulateButton.translatesAutoresizingMaskIntoConstraints = false
        simulateButton.addTarget(self, action: #selector(simulateChanges(_:)), for: .touchUpInside)
        view.addSubview(simulateButton)
        
        control.heightAnchor.constraint(equalToConstant: 30).isActive = true
        control.widthAnchor.constraint(equalToConstant: 200).isActive = true
        control.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        control.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        contactsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        contactsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsCollectionView.topAnchor.constraint(equalTo: control.bottomAnchor, constant: 10).isActive = true
        
        simulateButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        simulateButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        simulateButton.topAnchor.constraint(equalTo: contactsCollectionView.bottomAnchor, constant: 10).isActive = true
        simulateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        simulateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contactsCollectionView.configureCollectionViewLayoutItemSize()
    }
}

extension ViewController{
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            contactsCollectionView.layoutOption = .list
            contactsCollectionView.setupLayout(with: CGSize(width: contactsCollectionView.frame.width, height: 50))
            break
        case 1:
            contactsCollectionView.layoutOption = .grid
            contactsCollectionView.setupLayout(with: CGSize(width: 50, height: 50))
            break
        default:
            break
        }
    }
    
    @objc func simulateChanges(_ sender: UIButton) {
        contactsCollectionView.changeModel()
        let newUsers = Int.random(in: 1...60)
        for _ in 0...newUsers{
            userManager.fetchUser()
        }
    }
    
    @objc func presentUserVC(_ notification: Notification){
        let userVC = UserViewController()
        userVC.modalPresentationStyle = .fullScreen
        present(userVC, animated: true) {
            userVC.user = (notification.userInfo?["userInfo"] as! UserModel)
        }
    }
}

extension ViewController: UserManagerDelegate{
    
    func didUpdateUser(_ userManager: UserManager, user: UserModel) {
        DispatchQueue.main.async {
            self.users.append(user)
            self.contactsCollectionView.appendUsers(with: user)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
