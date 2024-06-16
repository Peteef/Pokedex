//
//  PokemonService.swift
//  Pokedex
//
//  Created by Kamil Turek on 11/06/2024.
//

import Foundation

struct Sprites: Decodable {
    let frontDefault: String
    let backDefault: String
    let frontShiny: String
    let backShiny: String
}

struct PokemonTypeResource: Decodable {
    let name: String
    let url: String
}

struct PokemonType: Decodable {
    let type: PokemonTypeResource
}

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [PokemonType]
}

private let baseUrl = "https://pokeapi.co/api/v2/pokemon"

private var cacheById: [Int: Pokemon] = [:]
private var cacheByName: [String: Pokemon] = [:]

func callPokemonService(pokemonQuery: String, onSuccess: @escaping (Pokemon) -> Void) {
    let formattedQuery = pokemonQuery.lowercased()
    
    if let fromCache = cacheByName[formattedQuery] {
        print("From cache by name \(formattedQuery)")
        onSuccess(fromCache)
        return
    }
    
    if let id = Int(formattedQuery), let fromCache = cacheById[id] {
        print("From cache by id \(id)")
        onSuccess(fromCache)
        return
    }
    
    URLSession.shared.dataTask(with: buildUrl(with: formattedQuery), completionHandler: { (data, response, error) in
        if let error = error {
            print("Error accessing pokeapi.co: \(error)")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let data = data, let decoded = try? decoder.decode(Pokemon.self, from: data) {
            addToCache(decoded)
            onSuccess(decoded)
        }
    }).resume()
}

private func addToCache(_ pokemon: Pokemon) {
    cacheById[pokemon.id] = pokemon
    cacheByName[pokemon.name] = pokemon
}

private func buildUrl(with query: String) -> URL {
    return URL(string: "\(baseUrl)/\(query)")!
}

