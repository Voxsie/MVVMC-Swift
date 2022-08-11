//
//  ViewModel.swift
//  MVVMC
//
//  Created by Илья on 10.08.2022.
//

import Foundation
import UIKit

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(UIColor.label)
    var statusTextSize = Dynamic(14)
    var isLoggedIn = false
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password { statusText.value = "Login failed"
            statusColor.value = UIColor.red
            statusTextSize.value = 7
            isLoggedIn = false
        }
        else { statusText.value = "You successfully logged in"
            statusColor.value = UIColor.green
            statusTextSize.value = 24
            isLoggedIn = true
        }
    }
}
