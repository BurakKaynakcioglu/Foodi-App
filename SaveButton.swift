//
//  SaveButton.swift
//  Foodi
//
//  Created by Burak on 25.10.2023.
//

import SwiftUI

struct SaveButton: View {
	@Environment(\.managedObjectContext) var moc
	
	@Binding var name: String
	@Binding var selectedCategory: String
	@Binding var discription: String
	@Binding var ingredients: String
	@Binding var directions: String
	@Binding var placament: Int
	
	var image: UIImage?

	
	var body: some View {
		Button {
			let newRecipe = Recipe(context: 	moc)
			
			newRecipe.id = UUID()
			newRecipe.name = name.trimmingCharacters(in: .whitespaces)
			newRecipe.category = selectedCategory
			newRecipe.discription = discription.trimmingCharacters(in: .whitespaces)
			newRecipe.ingredients = ingredients.trimmingCharacters(in: .whitespaces)
			newRecipe.directions = directions.trimmingCharacters(in: .whitespaces)
			newRecipe.datePublished = Date.now
			
			if let imageData = image?.jpegData(compressionQuality: 1.0) {
				newRecipe.image = imageData
			}
			
			try? moc.save()
			
			placament = 1
			
			name = ""
			selectedCategory = "Main"
			discription = ""
			ingredients = ""
			directions = ""			
		} label: {
			Text("Done")
		}
		.disabled(isEmpty(name: name, ingredients: ingredients) == false)
	}
	
	func isEmpty(name: String, ingredients: String) -> Bool {
		let trimmedName = name.trimmingCharacters(in: .whitespaces)
		let trimmedIngredients = ingredients.trimmingCharacters(in: .whitespaces)
		
		if trimmedName.isEmpty || trimmedIngredients.isEmpty {
			return false
		}
		
		return true
	}

}

//#Preview {
//    SaveButton()
//}
