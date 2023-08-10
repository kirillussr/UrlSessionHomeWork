//
//  Model.swift
//  UrlSessionHomeWork
//
//  Created by Кирилл on 07.08.2023.
//

import Foundation

struct StarWars: Decodable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate:String
    let gravity:String
    let terrain:String
    let surface_water:String
    let population:String
    let residents:[String]
    let films:[String]
    let created:String
    let edited:String
    let url :String
}
