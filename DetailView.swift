//
//  DetailView.swift
//  Foodi
//
//  Created by Burak on 25.10.2023.
//

import SwiftUI

struct DetailView: View {
	@Environment(\.managedObjectContext) var moc
	@Environment(\.dismiss) var dismiss

	let recipe: Recipe
	@State private var showingDeleteAlert = false

    var body: some View {
		ScrollView {
			ZStack(alignment: .bottomTrailing) {
				if let imageData = recipe.image, let uiImage = UIImage(data: imageData) {
					Image(uiImage: uiImage)
						.resizable()
						.scaledToFit()
				} else {
					Image(.empty)
						.resizable()
						.scaledToFit()
				}
				
				Text(recipe.category ?? "")
					.font(.caption)
					.fontWeight(.black)
					.padding(8)
					.foregroundStyle(.white)
					.background(.black.opacity(0.75))
					.clipShape(Capsule())
					.offset(x: -5, y: -5)
			}
			
			VStack(alignment: .leading, spacing: 30) {
					Text(recipe.discription ?? "")
						.fontWeight(.medium)

				
				VStack(alignment: .leading, spacing: 15) {
						Text("Ingredients")
							.font(.system(size: 25))
							.bold()
						
						Text(recipe.ingredients ?? "")
							.fontWeight(.medium)
				}
				
				VStack(alignment: .leading, spacing: 15) {
						Text("Directions")
							.font(.system(size: 25))
							.bold()
						
						Text(recipe.directions ?? "")
							.fontWeight(.medium)
				}
				
				Text((recipe.datePublished?.formatted(date: .complete, time: .omitted)) ?? "")
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding()
		}
		.toolbar {
			Button {
				showingDeleteAlert = true
			} label: {
				Label("Delete this recipe", systemImage: "trash")
			}
		}
		.alert("Delete", isPresented: $showingDeleteAlert) {
			Button("Delete", role: .destructive, action: deleteRecipe)
			Button("Cancel", role: .cancel) { }
		} message: {
			Text("Are you sure want to delete")
		}
		.background(.cyan.opacity(0.3))
		.toolbarBackground(.cyan.opacity(0.4), for: .navigationBar)
		.navigationTitle(recipe.name ?? "")
		.navigationBarTitleDisplayMode(.inline)
	}
	
	func deleteRecipe() {
		moc.delete(recipe)
		
		try? moc.save()
		
		dismiss()
	}
}

//#Preview {
//	DetailView()
//}
