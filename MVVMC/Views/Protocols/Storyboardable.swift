//
//  Storyboardable.swift
//  MVVMC
//
//  Created by Илья on 11.08.2022.
//

import Foundation
import UIKit


protocol Storyboardable {
    static func createObject() -> Self
}

extension Storyboardable where Self: UIViewController {
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
