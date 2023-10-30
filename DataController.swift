//
//  DataController.swift
//  Foodi
//
//  Created by Burak on 25.10.2023.
//

import CoreData
import Foundation
 
class DataController: ObservableObject {
	let container = NSPersistentContainer(name: "Content")
	
	init() {
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
			
		}
	}
}
