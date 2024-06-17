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
            PokemonSearchView(phrase: $searchPhrase, selectedPokemon: $selectedPokemon)
            Spacer()
            if let pokemon = selectedPokemon {
                VStack {
                    TitleWithBrowseView(pokemon: pokemon, selectedPokemon: $selectedPokemon)
                    PokemonDataView(pokemon: pokemon)
                    Spacer()
                    SpritesView(pokemon: pokemon)
                }.padding([.top, .bottom], 40)
            }
        }.padding()
    }
}

#Preview {
    PokedexView()
}
