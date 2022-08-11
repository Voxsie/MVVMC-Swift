//
//  DetailViewController.swift
//  MVVMC
//
//  Created by Илья on 11.08.2022.
//

import UIKit

class DetailViewController: UIViewController {

    weak var coordinator: AppCoordinator?
    var viewModel: DetailViewModel?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        nameLabel.text = viewModel?.model?.name
        cityLabel.text = viewModel?.model?.city
        emailLabel.text = viewModel?.model?.email
        phoneLabel.text = viewModel?.model?.phone
    }
}

extension DetailViewController: Storyboardable {}
