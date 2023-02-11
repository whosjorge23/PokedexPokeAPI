//
//  Pokemon.swift
//  PokedexPokeAPI
//
//  Created by Giorgio Giannotta on 10/02/23.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let url: URL
}

struct PokemonResponse: Codable {
    let results: [Pokemon]
}

struct PokemonDetails: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
    
    struct Sprites: Codable {
        let front_default: URL?
    }
}
