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
    let isBaby: Bool
    let isLegendary: Bool
    let isMythical: Bool
    let evolutionChain: EvolutionChain?
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

struct EvolutionChain {
    let id: Int
}

func mapToPokemon(of response: PokemonResponse, species: PokemonSpeciesResponse, evolution: EvolutionChainResponse) -> Pokemon {
    return Pokemon(
        id: response.id,
        name: response.name,
        height: response.heightInCentimeters,
        weight: response.weightInGrams,
        sprites: response.sprites,
        types: response.types.map { PokemonType(rawValue: $0.type.name)! }, // TODO: Think of better handling potential errors
        isBaby: species.isBaby,
        isLegendary: species.isLegendary,
        isMythical: species.isMythical,
        evolutionChain: mapToEvolutionChain(of: evolution)
    )
}

func mapToEvolutionChain(of response: EvolutionChainResponse) -> EvolutionChain {
    EvolutionChain(id: response.id)
}
