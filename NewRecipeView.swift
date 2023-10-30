//
//  NewRecipeView.swift
//  Foodi
//
//  Created by Burak on 25.10.2023.
//

import SwiftUI

struct NewRecipeView: View {
	
	@State private var name = ""
	@State private var selectedCategory = "Main"
	@State private var discription = ""
	@State private var ingredients = ""
	@State private var directions = ""
	
	@State private var inputImage: UIImage?
	@State private var image: Image?
	@State private var showImagePicker = false

	@Binding var placament: Int
	
	let category = ["Breakfast", "Soup", "Salad", "Appetizer", "Main", "Side", "Dessert", "Snack", "Drink"]


	var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("", text: $name)
				} header: {
					Text("Name*")
				}
				
				Section {
					Picker("Category", selection: $selectedCategory) {
						ForEach(category, id: \.self) {
							Text($0)
						}
					}
				} header: {
					Text("Category")
				}
				
				Section {
					TextEditor(text: $discription)
				} header: {
					Text("Description")
				}
				
				Section {
					TextEditor(text: $ingredients)
				} header: {
					Text("Ingredients*")
				}
				
				Section {
					TextEditor(text: $directions)
				} header: {
					Text("Directions")
				}
				
				Section {
					Button {
						showImagePicker = true
					} label: {
						Text("Add Image")
					}
					
					image?
						.resizable()
						.aspectRatio(contentMode: .fill)
						.clipShape(RoundedRectangle(cornerRadius: 8))
						.padding(.bottom, 5)
				}
				.listRowSeparator(.hidden)
			}
			.scrollContentBackground(.hidden)
			.background(.cyan.opacity(0.3))
			.toolbarBackground(.cyan.opacity(0.4), for: .navigationBar)
			.navigationTitle("New Recipe")
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					SaveButton(name: $name, selectedCategory: $selectedCategory, discription: $discription, ingredients: $ingredients, directions: $directions, placament: $placament, image: inputImage)
				}
			}
			.onChange(of: inputImage) { loadImage() }
			.sheet(isPresented: $showImagePicker) {
				ImagePicker(image: $inputImage)
					.ignoresSafeArea()
			}
		}
	}
	
	func isEmpty(name: String, ingredients: String) -> Bool {
		let trimmedName = name.trimmingCharacters(in: .whitespaces)
		let trimmedIngredients = ingredients.trimmingCharacters(in: .whitespaces)
		
		if trimmedName.isEmpty || trimmedIngredients.isEmpty {
			return false
		}
		
		
		
		return true
	}

	
	func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
	}
}

#Preview {
	NewRecipeView(placament: .constant(3))
}
