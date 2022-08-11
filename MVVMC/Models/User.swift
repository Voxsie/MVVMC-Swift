//
//  User.swift
//  MVVMC
//
//  Created by Илья on 10.08.2022.
//

import Foundation

struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [User(login: "admin", password: "admin")]
}
