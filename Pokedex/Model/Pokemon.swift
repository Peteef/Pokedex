//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kamil Turek on 20/06/2024.
//

import Foundation

struct Pokemon {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let sprites: Sprites
    let types: [PokemonType]
}

enum PokemonType: String {
    case bug = "bug"
    case dark = "dark"
    case dragon = "dragon"
    case electric = "electric"
    case fairy = "fairy"
    case fighting = "fighting"
    case fire = "fire"
    case flying = "flying"
    case ghost = "ghost"
    case grass = "grass"
    case ground = "ground"
    case ice = "ice"
    case normal = "normal"
    case poison = "poison"
    case psychic = "psychic"
    case rock = "rock"
    case steel = "steel"
    case water = "water"
}

func mapToPokemon(of response: PokemonResponse) -> Pokemon {
    return Pokemon(
        id: response.id,
        name: response.name,
        height: response.heightInCentimeters,
        weight: response.weightInGrams,
        sprites: response.sprites,
        types: response.types.map { PokemonType(rawValue: $0.type.name)! } // TODO: Think of better handling potential errors
    )
}
