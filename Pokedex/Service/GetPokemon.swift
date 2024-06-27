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
    var evolutionChainResponse: EvolutionChainResponse? = nil
    
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
            
            dispatchGroup.enter()
            callEvolutionChainService(url: res.evolutionChain.url) { res in
                DispatchQueue.main.async {
                    evolutionChainResponse = res
                    dispatchGroup.leave()
                }
            }
            
            dispatchGroup.leave()
        }
    }
    
    dispatchGroup.notify(queue: .main) {
        if let pokemonResponse = pokemonResponse, let pokemonSpeciesResponse = pokemonSpeciesResponse, let evolutionChainResponse = evolutionChainResponse {
            onSuccess(mapToPokemon(of: pokemonResponse, species: pokemonSpeciesResponse, evolution: evolutionChainResponse))
        }
    }
}
