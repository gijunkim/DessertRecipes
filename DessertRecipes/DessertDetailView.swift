//
//  DessertDetailView.swift
//  DessertRecipes
//
//  Created by June Kim on 4/28/23.
//

import SwiftUI

struct DessertDetailView: View {
    @StateObject private var viewModel = DessertViewModel()
    
    let dessert: Dessert

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(dessert.strMeal)
                    .font(.title)
                    .padding(.bottom)

                if let dessertDetail = viewModel.dessertDetail {
                    Text("Instructions")
                        .font(.headline)
                    Text(dessertDetail.strInstructions ?? "No instructions available.")
                        .padding(.bottom)

                    Text("Ingredients & Measurements")
                        .font(.headline)
                    ForEach(dessertDetail.ingredientMeasurementPairs(), id: \.0) { ingredient, measurement in
                        Text("\(ingredient): \(measurement)")
                    }
                } else {
                    Text("Loading details...")
                }
            }
            .padding()
        }
        .navigationBarTitle("Dessert Details", displayMode: .inline)
        .onAppear {
            viewModel.fetchDessertDetails(id: dessert.id)
        }
    }
}
