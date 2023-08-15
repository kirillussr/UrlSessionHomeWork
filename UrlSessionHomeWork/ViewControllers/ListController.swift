//
//  ListController.swift
//  StarWarsPlanets
//
//  Created by Кирилл on 14.08.2023.
//

import UIKit

final class ListController: UITableViewController {
 
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    //MARK: - Private property
    
    private var planets: [Planet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "galaxy"))
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchPlanet()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planets.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? PlanetViewCell else { return UITableViewCell() }
        cell.namePlanetLabel.text = planets[indexPath.row].name
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let planetVC = segue.destination as? PlanetViweController else { return }
            planetVC.planet = planets[indexPath.row]
        }
    }
}

//MARK: - Private methods

private extension ListController {
    
    func fetchPlanet() {

        NetworkManager.shared.fetch(StarWarsPlanet.self, from: URL(string: "https://swapi.dev/api/planets/?format=json")!) { [weak self] result in
            switch result {
            case .success(let planet):
                self?.planets = planet.results
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
               
            }
        }
    }
}
