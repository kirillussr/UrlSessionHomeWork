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
}

