//
//  NetworkManagers.swift
//  StarWarsPlanets
//
//  Created by Кирилл on 13.08.2023.
//

import Foundation
import Alamofire

enum Link: String {
    case url = "https://swapi.dev/api/planets/?format=json"
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPlanets(from url: String, completion: @escaping(Result<[Planet], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let planets = Planet.getPlanets(from: value)
                    completion(.success(planets))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
