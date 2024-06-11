//
//  PokedexView.swift
//  Pokedex
//
//  Created by Kamil Turek on 11/06/2024.
//

import SwiftUI

struct PokedexView: View {
    @State var searchPhrase: String = ""
    @State var selectedPokemon: Pokemon?
    
    var body: some View {
        VStack {
            TextField("Type a pokemon name or number", text: $searchPhrase)
                .onSubmit { callPokemonService(pokemonQuery: searchPhrase) { selectedPokemon = $0 } }
            Spacer()
            if let selectedPokemon = selectedPokemon {
                Text("#\(selectedPokemon.id) \(selectedPokemon.name.capitalized)")
                Spacer()
                VStack {
                    HStack {
                        AsyncImage(url: URL(string: selectedPokemon.sprites.frontDefault ))
                            .frame(width: 128, height: 128)
                        AsyncImage(url: URL(string: selectedPokemon.sprites.backDefault ))
                            .frame(width: 128, height: 128)
                    }
                    HStack {
                        AsyncImage(url: URL(string: selectedPokemon.sprites.frontShiny ))
                            .frame(width: 128, height: 128)
                        AsyncImage(url: URL(string: selectedPokemon.sprites.backShiny ))
                            .frame(width: 128, height: 128)
                        
                    }
                }
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    PokedexView()
}
