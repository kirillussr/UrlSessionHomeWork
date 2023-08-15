//
//  PlanetController.swift
//  StarWarsPlanets
//
//  Created by Кирилл on 14.08.2023.
//

import UIKit

final class PlanetViweController: UIViewController {

    @IBOutlet var planetDescriptionLabel: UILabel!
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxy")!)
        navigationController?.navigationBar.tintColor = .white
        planetDescriptionLabel.textColor = .white
        planetDescriptionLabel.text = planet.onePlanet
    }
}
