//
//  MainViewController.swift
//  MVVMC
//
//  Created by Илья on 11.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var aboutButton: UIButton!
    

    weak var coordinator: AppCoordinator?
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main screen loaded")
        mainLabel.text = "Hello \(viewModel?.login ?? "")"
        // Do any additional setup after loading the view.
    }
    @IBAction func aboutButtonPressed(_ sender: Any) {
        coordinator?.showDetail()
    }
}

extension MainViewController: Storyboardable {
//    coordinator?.showDetail()
}
