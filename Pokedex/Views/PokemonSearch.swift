//
//  PokemonSearch.swift
//  Pokedex
//
//  Created by Kamil Turek on 12/06/2024.
//

import SwiftUI

struct PokemonSearch: View {
    @Binding var phrase: String
    @Binding var selectedPokemon: Pokemon?
    
    var body: some View {
        TextField("Type a pokemon name or number", text: $phrase)
            .multilineTextAlignment(TextAlignment.center)
            .font(Font.system(size: 24))
            .autocorrectionDisabled()
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray)
                    .frame(height: 48)
            )
            .padding([.top, .bottom], 20)
            .onSubmit { callPokemonService(pokemonQuery: phrase) { selectedPokemon = $0 } }
    }
}

#Preview {
    PokemonSearch(phrase: .constant(""), selectedPokemon: .constant(nil))
}
