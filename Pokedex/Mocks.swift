//
//  Mocks.swift
//  Pokedex
//
//  Created by Kamil Turek on 17/06/2024.
//

import Foundation

let pikachuResponse = PokemonResponse(
    id: 25,
    name: "Pikachu",
    height: 4,
    weight: 60,
    sprites: Sprites(
        frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
        backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png",
        frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png",
        backShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/25.png"
    ),
    types: [
        PokemonTypeResponse(type: PokemonTypeResource(name: "electric", url: "https://pokeapi.co/api/v2/type/13/"))
    ]
)

let pikachuSpeciesResponse = PokemonSpeciesResponse(
    id: 25,
    name: "Pikachu",
    isBaby: true,
    isLegendary: false,
    isMythical: false
)

let pikachu = mapToPokemon(of: pikachuResponse, species: pikachuSpeciesResponse)
