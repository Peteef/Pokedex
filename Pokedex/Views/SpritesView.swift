//
//  SpritesView.swift
//  Pokedex
//
//  Created by Kamil Turek on 17/06/2024.
//

import SwiftUI

struct SpritesView: View {
    let pokemon: Pokemon
    
    var body: some View {
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
    }
}

#Preview {
    SpritesView(pokemon: pikachu)
}
