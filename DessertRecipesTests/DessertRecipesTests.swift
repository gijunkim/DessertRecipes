//
//  DessertRecipesTests.swift
//  DessertRecipesTests
//
//  Created by June Kim on 4/28/23.
//

import XCTest
@testable import DessertRecipes

class DessertTests: XCTestCase {

    func areArraysEqual(_ array1: [(String, String)], _ array2: [(String, String)]) -> Bool {
        guard array1.count == array2.count else {
            return false
        }
            
        for (index, element) in array1.enumerated() {
            if element.0 != array2[index].0 || element.1 != array2[index].1 {
                return false
            }
        }
            
        return true
    }
    
    func testIngredientMeasurementPairs() {
        let dessert = Dessert(
            idMeal: "1",
            strMeal: "Test Dessert",
            strMealThumb: nil,
            strInstructions: nil,
            strIngredient1: "Ingredient 1",
            strIngredient2: "Ingredient 2",
            strIngredient3: "",
            strIngredient4: nil,
            strIngredient5: nil,
            strIngredient6: nil,
            strIngredient7: nil,
            strIngredient8: nil,
            strIngredient9: nil,
            strIngredient10: nil,
            strIngredient11: nil,
            strIngredient12: nil,
            strIngredient13: nil,
            strIngredient14: nil,
            strIngredient15: nil,
            strIngredient16: nil,
            strIngredient17: nil,
            strIngredient18: nil,
            strIngredient19: nil,
            strIngredient20: nil,
            
            strMeasure1: "1 cup",
            strMeasure2: "2 tbsp",
            strMeasure3: "",
            strMeasure4: nil,
            strMeasure5: nil,
            strMeasure6: nil,
            strMeasure7: nil,
            strMeasure8: nil,
            strMeasure9: nil,
            strMeasure10: nil,
            strMeasure11: nil,
            strMeasure12: nil,
            strMeasure13: nil,
            strMeasure14: nil,
            strMeasure15: nil,
            strMeasure16: nil,
            strMeasure17: nil,
            strMeasure18: nil,
            strMeasure19: nil,
            strMeasure20: nil
        )

        let expectedPairs = [
            ("Ingredient 1", "1 cup"),
            ("Ingredient 2", "2 tbsp")
        ]
        
        XCTAssertTrue(areArraysEqual(dessert.ingredientMeasurementPairs(), expectedPairs))
    }
    
    func testFilterEmptyIngredientMeasurementPairs() {
        let dessert = Dessert(
            idMeal: "1",
            strMeal: "Test Dessert",
            strMealThumb: nil,
            strInstructions: nil,
            strIngredient1: "Ingredient 1",
            strIngredient2: "",
            strIngredient3: "Ingredient 3",
            strIngredient4: nil,
            strIngredient5: nil,
            strIngredient6: nil,
            strIngredient7: nil,
            strIngredient8: nil,
            strIngredient9: nil,
            strIngredient10: nil,
            strIngredient11: nil,
            strIngredient12: nil,
            strIngredient13: nil,
            strIngredient14: nil,
            strIngredient15: nil,
            strIngredient16: nil,
            strIngredient17: nil,
            strIngredient18: nil,
            strIngredient19: nil,
            strIngredient20: nil,
            
            strMeasure1: "1 cup",
            strMeasure2: "",
            strMeasure3: "3 tbsp",
            strMeasure4: nil,
            strMeasure5: nil,
            strMeasure6: nil,
            strMeasure7: nil,
            strMeasure8: nil,
            strMeasure9: nil,
            strMeasure10: nil,
            strMeasure11: nil,
            strMeasure12: nil,
            strMeasure13: nil,
            strMeasure14: nil,
            strMeasure15: nil,
            strMeasure16: nil,
            strMeasure17: nil,
            strMeasure18: nil,
            strMeasure19: nil,
            strMeasure20: nil
        )
            
        let expectedPairs = [
            ("Ingredient 1", "1 cup"),
            ("Ingredient 3", "3 tbsp")
        ]
            
        XCTAssertTrue(areArraysEqual(dessert.ingredientMeasurementPairs(), expectedPairs))
    }
}
