//
//  UserData.swift
//  MVVMC
//
//  Created by Илья on 11.08.2022.
//

import Foundation

struct UserData {
    var name: String?
    var city: String?
    var email: String?
    var phone: String?
}

extension UserData {
    static var userData = UserData(name: "Ilya",
                                   city: "Kazan",
                                   email: "djdmf@mail.ru",
                                   phone: "+567543546")
}
