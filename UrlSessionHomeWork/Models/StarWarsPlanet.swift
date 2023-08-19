//
//  StarWarsPlanet.swift
//  StarWarsPlanets
//
//  Created by Кирилл on 07.08.2023.
//

import Foundation

struct StarWarsPlanet: Decodable {
    
    let results: [Planet]
}

struct Planet: Decodable {
    
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    
    var onePlanet: String {
"""
Name planet: \(name)
Rotation period: \(rotation_period)
Orbital period: \(orbital_period)
Diameter: \(diameter)
Climate: \(climate)
Gravity: \(gravity)
Terrain: \(terrain)
Surface wather: \(surface_water)
Populations: \(population)
"""
    }
    
    init(value: [String: Any]) {
        name = value["name"] as? String ?? ""
        rotation_period = value["rotation_period"]as? String ?? ""
        orbital_period = value["orbital_period"] as? String ?? ""
        diameter = value["diameter"] as? String ?? ""
        climate = value["climate"] as? String ?? ""
        gravity = value["gravity"] as? String ?? ""
        terrain = value["terrain"] as? String ?? ""
        surface_water = value["surface_water"] as? String ?? ""
        population = value["population"] as? String ?? ""
    }
    
    static func getPlanets(from value: Any) -> [Planet] {
        guard let value = value as? [String: Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        var planets: [Planet] = []
        
        for result in results {
            let planet = Planet(value: result)
            planets.append(planet)
        }
        return planets
    }
}

