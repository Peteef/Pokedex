//
//  PokemonDataView.swift
//  Pokedex
//
//  Created by Kamil Turek on 17/06/2024.
//

import SwiftUI

func logoOfType(_ typeName: PokemonType) -> ImageResource {
    return pokemonTypes[typeName]!.icon
}

func formatHeight(centimeters: Int) -> String {
    centimeters < 100 ? "\(centimeters)cm" : "\(centimeters.doubleValue / 100)m"
}

func formatWeight(grams: Int) -> String {
    grams < 1000 ? "\(grams)g" : "\(grams.doubleValue / 1000)kg"
}

struct PokemonDataView: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            Text("Types:")
            ForEach(pokemon.types, id: \.rawValue) {
                Image(logoOfType($0))
                    .resizable()
                    .frame(width: 32, height: 32)
            }
        }
        Text("Height: \(formatHeight(centimeters: pokemon.height))")
        Text("Weight: \(formatWeight(grams: pokemon.weight))")
    }
}

#Preview {
    PokemonDataView(pokemon: pikachu)
}
