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
            PokemonSearch(phrase: $searchPhrase, selectedPokemon: $selectedPokemon)
            Spacer()
            if let pokemon = selectedPokemon {
                VStack {
                    TitleWithBrowse(pokemon: pokemon, selectedPokemon: $selectedPokemon)
                    HStack {
                        Text("Types:")
                        ForEach(pokemon.types, id: \.type.name) {
                            Image(logoOfType($0.type.name))
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                    }
                    Spacer()
                    VStack {
                        HStack {
                            AsyncImage(url: URL(string: pokemon.sprites.frontDefault ))
                                .frame(width: 128, height: 128)
                            AsyncImage(url: URL(string: pokemon.sprites.backDefault ))
                                .frame(width: 128, height: 128)
                        }
                        HStack {
                            AsyncImage(url: URL(string: pokemon.sprites.frontShiny ))
                                .frame(width: 128, height: 128)
                            AsyncImage(url: URL(string: pokemon.sprites.backShiny ))
                                .frame(width: 128, height: 128)
                            
                        }
                    }
                }.padding([.top, .bottom], 40)
            }
        }.padding()
    }
}

#Preview {
    PokedexView()
}
