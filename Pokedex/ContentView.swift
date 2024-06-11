//
//  ContentView.swift
//  Pokedex
//
//  Created by Kamil Turek on 11/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Pokedex")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
