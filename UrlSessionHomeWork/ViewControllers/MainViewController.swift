//
//  ViewController.swift
//  UrlSessionHomeWork
//
//  Created by Кирилл on 07.08.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBAction func GetJsonButtonTapped() {
        fetchStarWarsJson()
    }
}

private extension MainViewController {
    
    func fetchStarWarsJson() {
        guard let url = URL(string: "https://swapi.dev/api/planets/3/?format=json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let course = try decoder.decode(StarWars.self, from: data)
                print(course)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
