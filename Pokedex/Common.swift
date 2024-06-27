//
//  Common.swift
//  Pokedex
//
//  Created by Kamil Turek on 13/06/2024.
//

import Foundation
import SwiftUI

struct ExtendedPokemonType {
    let id: PokemonType
    let icon: ImageResource
}

let pokemonTypes = [
    PokemonType.bug: ExtendedPokemonType(id: .bug, icon: .bugTypeIcon),
    PokemonType.dark: ExtendedPokemonType(id: .dark, icon: .darkTypeIcon),
    PokemonType.dragon: ExtendedPokemonType(id: .dragon, icon: .dragonTypeIcon),
    PokemonType.electric: ExtendedPokemonType(id: .electric, icon: .electricTypeIcon),
    PokemonType.fairy: ExtendedPokemonType(id: .fairy, icon: .fairyTypeIcon),
    PokemonType.fighting: ExtendedPokemonType(id: .fighting, icon: .fightingTypeIcon),
    PokemonType.fire: ExtendedPokemonType(id: .fire, icon: .fireTypeIcon),
    PokemonType.flying: ExtendedPokemonType(id: .flying, icon: .flyingTypeIcon),
    PokemonType.ghost: ExtendedPokemonType(id: .ghost, icon: .ghostTypeIcon),
    PokemonType.grass: ExtendedPokemonType(id: .grass, icon: .grassTypeIcon),
    PokemonType.ground: ExtendedPokemonType(id: .ground, icon: .groundTypeIcon),
    PokemonType.ice: ExtendedPokemonType(id: .ice, icon: .iceTypeIcon),
    PokemonType.normal: ExtendedPokemonType(id: .normal, icon: .normalTypeIcon),
    PokemonType.poison: ExtendedPokemonType(id: .poison, icon: .poisonTypeIcon),
    PokemonType.psychic: ExtendedPokemonType(id: .psychic, icon: .psychicTypeIcon),
    PokemonType.rock: ExtendedPokemonType(id: .rock, icon: .rockTypeIcon),
    PokemonType.steel: ExtendedPokemonType(id: .steel, icon: .steelTypeIcon),
    PokemonType.water: ExtendedPokemonType(id: .water, icon: .waterTypeIcon)
]

struct Sprites: Decodable {
    let frontDefault: String
    let backDefault: String
    let frontShiny: String
    let backShiny: String
}

extension Int {
    var doubleValue: Double {
        Double(self)
    }
}

struct PokeApiResource: Decodable {
    let url: String
}
