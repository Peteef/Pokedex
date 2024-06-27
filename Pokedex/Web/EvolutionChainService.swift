//
//  EvolutionChainService.swift
//  Pokedex
//
//  Created by Kamil Turek on 27/06/2024.
//

import Foundation

private let urlPattern = "https://pokeapi\\.co/api/v2/evolution-chain/(?<id>\\d+)/"

struct EvolutionChainResponse: Decodable {
    let id: Int
}

private var cache: [String: EvolutionChainResponse] = [:]

func callEvolutionChainService(url: String, onSuccess: @escaping (EvolutionChainResponse) -> Void) {
    if let fromCache = cache[url] {
        print("[EvolutionChain] From cache by url \(url)")
        onSuccess(fromCache)
        return
    }
    
    callEvolutionChainApi(url: url, onSuccess: onSuccess)
}

private func callEvolutionChainApi(url: String, onSuccess: @escaping (EvolutionChainResponse) -> Void) {
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
        if let error = error {
            print("[EvolutionChain] Error accessing pokeapi.co: \(error)")
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        if let data = data, let decoded = try? decoder.decode(EvolutionChainResponse.self, from: data) {
            addToCache(url: url, evolutionChain: decoded)
            onSuccess(decoded)
        }
    }).resume()
}

private func addToCache(url: String, evolutionChain: EvolutionChainResponse) {
    cache[url] = evolutionChain
}
