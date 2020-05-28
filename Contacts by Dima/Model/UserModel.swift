//
//  UserModel.swift
//  Contacts by Dima
//
//  Created by DiMa on 28/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let status: Status
    let email: String
    let avatar: UIImage?
}

enum Status {
    case online
    case offline
}

extension User {
    static let defaultUsers: [User] = [
        User(name: "Andry Kuzmenko", status: .offline, email: "skriabin@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Sviatoslav Vakarchuk", status: .online, email: "okeanelzy@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleksandr Sydorenko", status: .online, email: "fozzy@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleg Myhailiuta", status: .online, email: "fagot@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleksandr Polozhynski", status: .online, email: "tnmk@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Andry Kuzmenko", status: .offline, email: "skriabin@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Sviatoslav Vakarchuk", status: .online, email: "okeanelzy@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleksandr Sydorenko", status: .online, email: "fozzy@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleg Myhailiuta", status: .online, email: "fagot@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleksandr Polozhynski", status: .online, email: "tnmk@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Andry Kuzmenko", status: .offline, email: "skriabin@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Sviatoslav Vakarchuk", status: .online, email: "okeanelzy@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleg Myhailiuta", status: .online, email: "fagot@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Oleksandr Polozhynski", status: .online, email: "tnmk@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Andry Kuzmenko", status: .offline, email: "skriabin@gmail.com", avatar: UIImage(named: "icons8-name-96")),
        User(name: "Sviatoslav Vakarchuk", status: .online, email: "okeanelzy@gmail.com", avatar: UIImage(named: "icons8-name-96"))
    ]
}
