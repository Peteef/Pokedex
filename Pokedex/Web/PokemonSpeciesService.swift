//
//  PokemonSpeciesService.swift
//  Pokedex
//
//  Created by Kamil Turek on 17/06/2024.
//

import Foundation

struct PokemonSpeciesResponse: Decodable {
    let id: Int
    let name: String
    let isBaby: Bool
    let isLegendary: Bool
    let isMythical: Bool
    let evolutionChain: PokeApiResource
}

private let baseUrl = "https://pokeapi.co/api/v2/pokemon-species"

private var cacheById: [Int: PokemonSpeciesResponse] = [:]
private var cacheByName: [String: PokemonSpeciesResponse] = [:]

func callPokemonSpeciesService(pokemonQuery: String, onSuccess: @escaping (PokemonSpeciesResponse) -> Void) {
    let formattedQuery = pokemonQuery.lowercased()
    
    if let fromCache = cacheByName[formattedQuery] {
        print("[PokemonSpecies] From cache by name \(formattedQuery)")
        onSuccess(fromCache)
        return
    }
    
    if let id = Int(formattedQuery), let fromCache = cacheById[id] {
        print("[PokemonSpecies] From cache by id \(id)")
        onSuccess(fromCache)
        return
    }
    
    callPokemonSpeciesApi(query: formattedQuery, onSuccess: onSuccess)
}

private func callPokemonSpeciesApi(query: String, onSuccess: @escaping (PokemonSpeciesResponse) -> Void) {
    URLSession.shared.dataTask(with: buildUrl(with: query), completionHandler: { (data, response, error) in
        if let error = error {
            print("[PokemonSpecies] Error accessing pokeapi.co: \(error)")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let data = data, let decoded = try? decoder.decode(PokemonSpeciesResponse.self, from: data) {
            addToCache(decoded)
            onSuccess(decoded)
        }
    }).resume()
}

private func addToCache(_ pokemonSpecies: PokemonSpeciesResponse) {
    cacheById[pokemonSpecies.id] = pokemonSpecies
    cacheByName[pokemonSpecies.name] = pokemonSpecies
}

private func buildUrl(with query: String) -> URL {
    return URL(string: "\(baseUrl)/\(query)")!
}
