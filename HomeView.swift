//
//  HomeView.swift
//  Foodi
//
//  Created by Burak on 25.10.2023.
//

import SwiftUI

struct HomeView: View {
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(key: "datePublished", ascending: false)]
	) var recipes: FetchedResults<Recipe>
		
	let columns = [GridItem(.adaptive(minimum: 160))]
	
	var body: some View {
		NavigationStack {
			ScrollView {
				Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
					.font(.headline)
					.fontWeight(.medium)
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
				
				LazyVGrid(columns: columns) {
					ForEach(recipes) { recipe in
						NavigationLink {
							DetailView(recipe: recipe)
						} label: {
							VStack {
								if let imageData = recipe.image, let uiImage = UIImage(data: imageData) {
									Image(uiImage: uiImage)
										.resizable()
										.aspectRatio(contentMode: .fill)
								} else {
									Image(.empty)
										.resizable()
										.aspectRatio(contentMode: .fill)
								}
								
								StrokeText(text: recipe.name ?? "" , width: 1.0, color: .black.opacity(0.80))
									.font(.headline)
									.shadow(color: .black.opacity(0.5), radius: 0.0)
									.foregroundStyle(.white)
									.padding(.vertical, 10)
									.padding(.top, -10)
									.frame(maxWidth: 130)
							}
							.frame(width: 160, height: 220)
							.background(.white.opacity(0.50))
							.clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
							.shadow(color: .gray.opacity(0.4), radius: 15)
							.padding(.vertical, 3)
							.overlay {
								RoundedRectangle(cornerRadius: 20)
									.stroke(.white, lineWidth: 1.7)
									.frame(width: 160, height: 220)
							}
						}
					}
				}
				.padding([.bottom, .horizontal])
			}
			.navigationTitle("My Recipes")
			.background(.cyan.opacity(0.3))
			.toolbarBackground(.cyan.opacity(0.4), for: .navigationBar)
		}
	}
}
									 

#Preview {
    HomeView()
}
