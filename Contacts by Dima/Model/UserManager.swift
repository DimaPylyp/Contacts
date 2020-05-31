//
//  UserManager.swift
//  Contacts by Dima
//
//  Created by DiMa on 30/05/2020.
//  Copyright © 2020 DiMa. All rights reserved.
//

import UIKit

protocol UserManagerDelegate {
    func didUpdateUser(_ userManager: UserManager, user: UserModel)
    func didFailWithError(_ error: Error)
}

struct UserManager {
    let nameURL = "https://api.namefake.com/"
    
    var delegate: UserManagerDelegate?
    
    func fetchUser() {
        let urlString = nameURL
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
           if let url = URL(string: urlString){
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { (data, response, error) in
                   if error != nil{
                       print (error!)
                       return
                   }
                   
                   if let safeData = data {
                    if let name = self.parseJSON(safeData){
                        let user = self.createNewUser(userName: name)
                        self.delegate?.didUpdateUser(self, user: user)
                    }
                       }
               }
                   task.resume()
           }
       }
    
    func parseJSON(_ userData: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decodedData: UserData = try decoder.decode(UserData.self, from: userData)
            let user = decodedData
                let name = user.name
            
            return name
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
    func createNewUser (userName: String) -> UserModel {
        var newUser = UserModel(name: "", status: .offline, email: "", avatarUrl: "", bigAvatarUrl: "")
                       let name = userName
                       let email = "\(name.filter ({!" ".contains($0) }))@example.com"
                       let md5Data = MD5(string: email)
                       let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
                       let status = Status.allCases.randomElement()
                       let avatarUrl = "https://www.gravatar.com/avatar/\(md5Hex)?s=32&d=monsterid&r=PG"
                        let bigAvatarUrl = "https://www.gravatar.com/avatar/\(md5Hex)?s=200&d=monsterid&r=PG"
                       
        newUser = UserModel(name: name, status: status!, email: email, avatarUrl: avatarUrl, bigAvatarUrl: bigAvatarUrl)
                   
                   return newUser
    }
}
