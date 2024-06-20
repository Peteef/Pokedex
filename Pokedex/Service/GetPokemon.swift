//
//  GetPokemon.swift
//  Pokedex
//
//  Created by Kamil Turek on 20/06/2024.
//

import Foundation

func getPokemon(pokemonQuery: String, onSuccess: @escaping (Pokemon) -> Void) {
    let dispatchGroup = DispatchGroup()
    var pokemonResponse: PokemonResponse? = nil
    var pokemonSpeciesResponse: PokemonSpeciesResponse? = nil
    
    dispatchGroup.enter()
    callPokemonService(pokemonQuery: pokemonQuery) { res in
        DispatchQueue.main.async {
            pokemonResponse = res
            dispatchGroup.leave()
        }
    }

    dispatchGroup.enter()
    callPokemonSpeciesService(pokemonQuery: pokemonQuery) { res in
        DispatchQueue.main.async {
            pokemonSpeciesResponse = res
            dispatchGroup.leave()
        }
    }
    
    dispatchGroup.notify(queue: .main) {
        if let pokemonResponse = pokemonResponse, let pokemonSpeciesResponse = pokemonSpeciesResponse {
            onSuccess(mapToPokemon(of: pokemonResponse))
        }
    }
}
