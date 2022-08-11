//
//  Coordinator.swift
//  MVVMC
//
//  Created by Илья on 11.08.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
