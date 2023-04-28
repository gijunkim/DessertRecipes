//
//  ContentView.swift
//  DessertRecipes
//
//  Created by June Kim on 4/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DessertViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.dessertList) { dessert in
                NavigationLink(destination: DessertDetailView(dessert: dessert)) {
                    Text(dessert.strMeal)
                }
            }
            .navigationTitle("Dessert Recipes")
            .onAppear {
                viewModel.fetchDessertList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
