//
//  Common.swift
//  Pokedex
//
//  Created by Kamil Turek on 13/06/2024.
//

import Foundation
import SwiftUI

struct ExtendedPokemonType {
    let id: String
    let icon: ImageResource
}

let pokemonTypes = [
    "bug": ExtendedPokemonType(id: "bug", icon: .bugTypeIcon),
    "dark": ExtendedPokemonType(id: "dark", icon: .darkTypeIcon),
    "dragon": ExtendedPokemonType(id: "dragon", icon: .dragonTypeIcon),
    "electric": ExtendedPokemonType(id: "electric", icon: .electricTypeIcon),
    "fairy": ExtendedPokemonType(id: "fairy", icon: .fairyTypeIcon),
    "fighting": ExtendedPokemonType(id: "fighting", icon: .fightingTypeIcon),
    "fire": ExtendedPokemonType(id: "fire", icon: .fireTypeIcon),
    "flying": ExtendedPokemonType(id: "flying", icon: .flyingTypeIcon),
    "ghost": ExtendedPokemonType(id: "ghost", icon: .ghostTypeIcon),
    "grass": ExtendedPokemonType(id: "grass", icon: .grassTypeIcon),
    "ground": ExtendedPokemonType(id: "ground", icon: .groundTypeIcon),
    "ice": ExtendedPokemonType(id: "ice", icon: .iceTypeIcon),
    "normal": ExtendedPokemonType(id: "normal", icon: .normalTypeIcon),
    "poison": ExtendedPokemonType(id: "poison", icon: .poisonTypeIcon),
    "psychic": ExtendedPokemonType(id: "psychic", icon: .psychicTypeIcon),
    "rock": ExtendedPokemonType(id: "rock", icon: .rockTypeIcon),
    "steel": ExtendedPokemonType(id: "steel", icon: .steelTypeIcon),
    "water": ExtendedPokemonType(id: "water", icon: .waterTypeIcon)
]

extension Int {
    var doubleValue: Double {
        Double(self)
    }
}
