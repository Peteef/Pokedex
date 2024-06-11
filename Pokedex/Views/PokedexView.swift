//
//  PokedexView.swift
//  Pokedex
//
//  Created by Kamil Turek on 11/06/2024.
//

import SwiftUI

struct Sprites: Decodable {
    let front_default: String
}

struct Pokemon: Decodable {
    let name: String
    let sprites: Sprites
}

func callPokemonService(pokemon: String, onSuccess: @escaping (Pokemon) -> Void) {
    //Parse URL
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemon.lowercased())/")
    let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
        print("Calling \(url?.absoluteString ?? "no url")")
        if let error = error {
          print("Error accessing pokeapi.co: \(error)")
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
          print("Error with the response, unexpected status code: \(response!)")
          return
        }
        
        if let data = data, let decoded = try? JSONDecoder().decode(Pokemon.self, from: data) {
            onSuccess(decoded)
            print(decoded)
        }
    })

    task.resume()
}

struct PokedexView: View {
    @State var searchPhrase: String = ""
    @State var selectedPokemon: Pokemon?
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Type a pokemon name or number", text: $searchPhrase)
                .onSubmit { callPokemonService(pokemon: searchPhrase) { selectedPokemon = $0 } }
            Spacer()
            Text(selectedPokemon?.name.capitalized ?? "")
            Spacer()
            AsyncImage(url: URL(string: selectedPokemon?.sprites.front_default ?? ""))
                .frame(width: 128, height: 128)
                .disabled(selectedPokemon != nil)
            Spacer()
        }.padding()
    }
}

#Preview {
    PokedexView()
}
