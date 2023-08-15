//
//  MainViewController.swift
//  StarWarsPlanets
//
//  Created by Кирилл on 07.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxy")!)
    }
    
    @IBAction func GetJsonButtonTapped() {
    }
}

