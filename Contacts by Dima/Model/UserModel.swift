//
//  UserModel.swift
//  Contacts by Dima
//
//  Created by DiMa on 28/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

struct UserModel: Equatable {
    let name: String
    var status: Status
    let email: String
    let avatarUrl: String
    let bigAvatarUrl: String
}

enum Status: CaseIterable {
    case online
    case offline
}
