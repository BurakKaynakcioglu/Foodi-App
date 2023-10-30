//
//  TabBar.swift
//  Foodi
//
//  Created by Burak on 25.10.2023.
//

import SwiftUI

struct TabBar: View {
	@State private var placament = 1
	
	var body: some View {
		TabView(selection: $placament) {
			Group {
				HomeView()
					.tabItem {
						Label("Home", systemImage: "house")
					}.tag(1)
				
				CategoriesView()
					.tabItem {
						Label("Categories", systemImage: "square.fill.text.grid.1x2")
					}.tag(2)
				
				NewRecipeView(placament: $placament)
					.tabItem {
						Label("New", systemImage: "plus")
					}.tag(3)
			}
			.toolbarBackground(.cyan.opacity(0.17), for: .tabBar)

		}
	}
}

#Preview {
    TabBar()
}
