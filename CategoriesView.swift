//
//  CategoriesView.swift
//  Foodi
//
//  Created by Burak on 25.10.2023.
//

import SwiftUI

struct CategoriesView: View {
	let category = ["Breakfast", "Soup", "Salad", "Appetizer", "Main", "Side", "Dessert", "Snack", "Drink"]
	
	var body: some View {
		NavigationStack {
			List {
				ForEach(category, id: \.self) { item in
					NavigationLink {
						RecipeView(category: item)
					} label: {
						Text(item)
							.padding(11)
					}
				}
				.listRowBackground(Color.cyan.opacity(0.001))
			}
			
			.listStyle(.plain)
			.navigationTitle("Categories")
			.scrollContentBackground(.hidden)
			.background(.cyan.opacity(0.3))
			.toolbarBackground(.cyan.opacity(0.4), for: .navigationBar)
		}
	}
}

#Preview {
    CategoriesView()
}
