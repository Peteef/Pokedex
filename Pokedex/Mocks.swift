//
//  Mocks.swift
//  Pokedex
//
//  Created by Kamil Turek on 17/06/2024.
//

import Foundation

let pikachu = Pokemon(
    id: 25,
    name: "Pikachu",
    sprites: Sprites(
        frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
        backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png",
        frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png",
        backShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/25.png"
    ),
    types: [
        PokemonType(type: PokemonTypeResource(name: "electric", url: "https://pokeapi.co/api/v2/type/13/"))
    ]
)
