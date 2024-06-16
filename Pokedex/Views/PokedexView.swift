//
//  PokedexView.swift
//  Pokedex
//
//  Created by Kamil Turek on 11/06/2024.
//

import SwiftUI

func logoOfType(_ typeName: String) -> ImageResource {
    return pokemonTypes[typeName.lowercased()]!.icon
}

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
                    HStack {
                        Text("Types:")
                        ForEach(pokemon.types, id: \.type.name) {
                            Image(logoOfType($0.type.name))
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                    }
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
