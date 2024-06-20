//
//  PokemonService.swift
//  Pokedex
//
//  Created by Kamil Turek on 11/06/2024.
//

import Foundation

struct PokemonTypeResource: Decodable {
    let name: String
    let url: String
}

struct PokemonTypeResponse: Decodable {
    let type: PokemonTypeResource
}

struct PokemonResponse: Decodable {
    let id: Int
    let name: String
    
    let height: Int
    var heightInCentimeters: Int {
        height * 10
    }
    
    let weight: Int
    var weightInGrams: Int {
        weight * 100
    }
    
    let sprites: Sprites
    let types: [PokemonTypeResponse]
}

private let baseUrl = "https://pokeapi.co/api/v2/pokemon"

private var cacheById: [Int: PokemonResponse] = [:]
private var cacheByName: [String: PokemonResponse] = [:]

func callPokemonService(pokemonQuery: String, onSuccess: @escaping (PokemonResponse) -> Void) {
    let formattedQuery = pokemonQuery.lowercased()
    
    if let fromCache = cacheByName[formattedQuery] {
        print("[Pokemon] From cache by name \(formattedQuery)")
        onSuccess(fromCache)
        return
    }
    
    if let id = Int(formattedQuery), let fromCache = cacheById[id] {
        print("[Pokemon] From cache by id \(id)")
        onSuccess(fromCache)
        return
    }
    
    callPokemonApi(query: formattedQuery, onSuccess: onSuccess)
}

private func callPokemonApi(query: String, onSuccess: @escaping (PokemonResponse) -> Void) {
    URLSession.shared.dataTask(with: buildUrl(with: query), completionHandler: { (data, response, error) in
        if let error = error {
            print("[Pokemon] Error accessing pokeapi.co: \(error)")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let data = data, let decoded = try? decoder.decode(PokemonResponse.self, from: data) {
            addToCache(decoded)
            onSuccess(decoded)
        }
    }).resume()
}

private func addToCache(_ pokemon: PokemonResponse) {
    cacheById[pokemon.id] = pokemon
    cacheByName[pokemon.name] = pokemon
}

private func buildUrl(with query: String) -> URL {
    return URL(string: "\(baseUrl)/\(query)")!
}
