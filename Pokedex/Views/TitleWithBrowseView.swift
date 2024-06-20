//
//  TitleWithBrowseView.swift
//  Pokedex
//
//  Created by Kamil Turek on 13/06/2024.
//

import SwiftUI

struct TitleWithBrowseView: View {
    let pokemon: Pokemon
    @Binding var selectedPokemon: Pokemon?
    
    var body: some View {
        HStack {
            Button {
                getPokemon(pokemonQuery: String(pokemon.id - 1)) { selectedPokemon = $0 }
            } label: {
                Image(systemName: "arrow.backward.square")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .tint(.black)
            }.disabled(pokemon.id < 2)
            Text("#\(pokemon.id) \(pokemon.name.capitalized)")
                .font(Font.system(size: 32))
            Button {
                getPokemon(pokemonQuery: String(pokemon.id + 1)) { selectedPokemon = $0 }
            } label: {
                Image(systemName: "arrow.forward.square")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .tint(.black)
            }.disabled(pokemon.id > 898) // TODO: Make sure this is the cap or maybe some of the resources are not present and crash
        }
    }
}

#Preview {
    return TitleWithBrowseView(pokemon: pikachu, selectedPokemon: .constant(pikachu))
}
