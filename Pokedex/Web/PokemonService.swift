//
//  PokemonService.swift
//  Pokedex
//
//  Created by Kamil Turek on 11/06/2024.
//

import Foundation

let baseUrl = "https://pokeapi.co/api/v2/pokemon"

struct Sprites: Decodable {
    let frontDefault: String
    let backDefault: String
    let frontShiny: String
    let backShiny: String
}

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let sprites: Sprites
}

func callPokemonService(pokemonQuery: String, onSuccess: @escaping (Pokemon) -> Void) {
    URLSession.shared.dataTask(with: buildUrl(with: pokemonQuery), completionHandler: { (data, response, error) in
        if let error = error {
            print("Error accessing pokeapi.co: \(error)")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let data = data, let decoded = try? decoder.decode(Pokemon.self, from: data) {
            onSuccess(decoded)
        }
    }).resume()
}

private func buildUrl(with query: String) -> URL {
    return URL(string: "\(baseUrl)/\(query.lowercased())")!
}

