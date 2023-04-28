//
//  DessertViewModel.swift
//  DessertRecipes
//
//  Created by June Kim on 4/28/23.
//

import Foundation
import Combine

class DessertViewModel: ObservableObject {
    @Published var dessertList: [Dessert] = []
    @Published var dessertDetail: Dessert?

    let dessertApi = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"

    func fetchDessertList() {
        guard let url = URL(string: dessertApi) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            let decoder = JSONDecoder()
            if let dessertsResponse = try? decoder.decode(DessertsResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.dessertList = dessertsResponse.meals
                }
            }
        }.resume()
    }

    func fetchDessertDetails(id: String) {
        let detailApi = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"

        guard let url = URL(string: detailApi) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }

            let decoder = JSONDecoder()
            if let dessertDetailResponse = try? decoder.decode(DessertDetailResponse.self, from: data),
               let dessertDetail = dessertDetailResponse.meals.first {
                DispatchQueue.main.async {
                    self.dessertDetail = dessertDetail
                }
            } else {
                self.dessertDetail = nil
            }
        }.resume()
    }
}

private struct DessertsResponse: Codable {
    let meals: [Dessert]
}

private struct DessertDetailResponse: Codable {
    let meals: [Dessert]
}
